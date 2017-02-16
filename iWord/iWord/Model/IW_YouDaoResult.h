//
//  IW_YouDaoResult.h
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_WordBaseModel.h"

@interface IW_YouDaoResult : IW_WordBaseModel

@property (nonatomic, strong) NSArray *webExplains; //网络释义
@property (nonatomic, copy)   NSString *translation;

@end
