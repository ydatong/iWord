//
//  IW_AppManager.h
//  iWord
//
//  Created by 周永 on 17/2/16.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,IW_LaunchType) {
    
    IW_LaunchTypeQuery = 1, //查词
    IW_LaunchTypeList ,      //单词列表
    IW_LaunchTypeExplain    //单词解释
};

@interface IW_AppManager : NSObject

+ (instancetype)defaultManager;

@property (nonatomic, assign) IW_LaunchType launchType;

@end
