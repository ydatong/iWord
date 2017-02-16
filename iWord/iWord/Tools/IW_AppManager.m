
//
//  IW_AppManager.m
//  iWord
//
//  Created by 周永 on 17/2/16.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_AppManager.h"

static IW_AppManager *manager = nil;

@implementation IW_AppManager

+ (instancetype)defaultManager {
    
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[IW_AppManager alloc] init];
        });
    }
    return manager;
}

@end
