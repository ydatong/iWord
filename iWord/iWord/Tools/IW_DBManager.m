
//
//  IW_DBManager.m
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_DBManager.h"

static IW_DBManager *manager = nil;

@implementation IW_DBManager

+ (instancetype)defaultManager {
    
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[IW_DBManager alloc] init];
        });
    }
    
    return manager;
}

@end
