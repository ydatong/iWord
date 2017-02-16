//
//  IW_WordAPITools.m
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_WordAPITool.h"
#import "AFNetworking.h"

static IW_WordAPITool *tool = nil;

@implementation IW_WordAPITool

+ (instancetype)sharedTool {
    
    if (!tool) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            tool = [[IW_WordAPITool alloc] init];
        });
    }
    
    return tool;
}

- (void)queryWord:(NSString *)word resultHandle:(ResultBlock)resultBlock{
    
    return [self queryWord:word withApiType:IWApiTypeYouDao resultHandle:resultBlock];
}

- (void)queryWord:(NSString *)word withApiType:(IWApiType)apiType resultHandle:(ResultBlock)resultBlock{
    
    switch (apiType) {
        case IWApiTypeYouDao:
        {
            [self youDaoQuery:word resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
                resultBlock(resultModel,error);
            }];
        }
            break;
        case IWApiTypeJinShan:{
            [self jinShanQuery:word resultHandle:^(IW_WordBaseModel *resultModel, NSError *error) {
                resultBlock(resultModel,error);
            }];
        }
            break;
        default:
            break;
    }
}

//有道api请求
- (void)youDaoQuery:(NSString*)word resultHandle:(ResultBlock)resultBlock{
    
    [self queryWordOfUrl:[NSString stringWithFormat:@"%@%@",IW_YouDaoApi,word]  resultHandle:^(NSDictionary *resultDict, NSError *error) {
       
        if (!error && [resultDict[@"errorCode"] integerValue] == 0) {
            IW_YouDaoResult *result = [IW_YouDaoResult modelWithDict:resultDict];
            resultBlock(result,error);
        }
        
    }];
}

//金山api请求
- (void)jinShanQuery:(NSString*)word resultHandle:(ResultBlock)resultBlock{
    
    [self queryWordOfUrl:[NSString stringWithFormat:@"%@%@",IW_JinShanApi,word]  resultHandle:^(NSDictionary *resultDict, NSError *error) {
        
        if (!error) {
            IW_JinShanResult *result = [IW_JinShanResult modelWithDict:resultDict];
            resultBlock(result,error);
        }
    }];
}


//公用请求方法
- (void)queryWordOfUrl:(NSString*)urlString resultHandle:(void(^)(NSDictionary *resultDict, NSError *error))resultBlock {
    
    NSString *str = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];;
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfig];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            resultBlock(responseObject,error);
        }
    }];
    [task resume];
}

@end

























