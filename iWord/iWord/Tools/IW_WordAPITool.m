//
//  IW_WordAPITools.m
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_WordAPITool.h"

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
       
        IW_YouDaoResult *result = [IW_YouDaoResult modelWithDict:resultDict];
        resultBlock(result,error);
    }];
}


//公用请求方法
- (void)queryWordOfUrl:(NSString*)url resultHandle:(void(^)(NSDictionary *resultDict, NSError *error))resultBlock {
    
    
}

@end
