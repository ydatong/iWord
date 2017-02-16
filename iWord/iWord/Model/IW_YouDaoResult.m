//
//  IW_YouDaoResult.m
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_YouDaoResult.h"

@implementation IW_YouDaoResult

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    IW_YouDaoResult *result = [[IW_YouDaoResult alloc] init];
    
    result.wordId = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000];
    result.createTime = [NSDate date];
    result.times = 1;
    
    NSDictionary *basic = dict[@"basic"];
    result.word = dict[@"query"];
    result.prefixLetter = [result.word substringToIndex:1];
    result.explains = basic[@"explains"];
    result.phoneticAM = basic[@"us-phonetic"];
    result.phoneticUK = basic[@"uk-phonetic"];
    result.webExplains = dict[@"web"];
    result.translation = dict[@"translation"];
    return result;
}

- (NSString*)explainString {
    
    NSMutableString *str = [NSMutableString string];
    
    for (int i = 0 ; i < self.explains.count; i++) {
        [str appendString:self.explains[i]];
        if (i != self.explains.count -1) [str appendString:@"\n"];
    }
    
    return [NSString stringWithFormat:@"%@",str];
}

- (NSString*)compactExplainString {
    
    NSMutableString *str = [NSMutableString string];
    
    for (int i = 0 ; i < self.explains.count; i++) {
        [str appendString:self.explains[i]];
        if (i != self.explains.count -1) [str appendString:@" "];
    }
    return [NSString stringWithFormat:@"%@",str];
}

@end
