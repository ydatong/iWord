//
//  IW_JinShanResult.m
//  iWord
//
//  Created by kanewang on 2017/2/15.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_JinShanResult.h"

@implementation IW_JinShanResult

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    IW_JinShanResult *result = [[IW_JinShanResult alloc] init];
    
    result.wordId = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000];
    result.createTime = [NSDate date];
    result.times = 1;
    
    result.word = dict[@"word_name"];
    result.prefixLetter = [result.word substringToIndex:1];
    NSDictionary *symbol = [dict[@"symbols"] firstObject];
    result.explains = symbol[@"parts"];
    result.phoneticAM = symbol[@"ph_am"];
    result.phoneticUK = symbol[@"ph_en"];
    result.phoneticAMMp3 = symbol[@"ph_am_mp3"];
    result.phoneticUKMp3 = symbol[@"ph_en_mp3"];
    return result;
}

@end
