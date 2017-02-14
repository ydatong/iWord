//
//  IW_SharedTool.h
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//



/*
 有道:
 API key：608162978
 keyfrom：iWord-2017
 http://fanyi.youdao.com/openapi.do?keyfrom=iWord-2017&key=608162978&type=data&doctype=<doctype>&version=1.1&q=要翻译的文本
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - tools
#import "IW_DBManager.h"
#import "IW_WordAPITool.h"

#pragma mark - model
#import "IW_WordBaseModel.h"
#import "IW_YouDaoResult.h"


#pragma mark - constant

UIKIT_EXTERN NSString *const IW_YouDaoApi;
