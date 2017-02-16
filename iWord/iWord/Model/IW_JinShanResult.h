//
//  IW_JinShanResult.h
//  iWord
//
//  Created by kanewang on 2017/2/15.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import "IW_WordBaseModel.h"

@interface IW_JinShanResult : IW_WordBaseModel

@property (nonatomic, copy) NSString *phoneticAMMp3; //美式音标MP3路径
@property (nonatomic, copy) NSString *phoneticUKMp3; //英式音标MP3路径

@end
