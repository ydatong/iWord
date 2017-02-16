//
//  IW_WordBaseModel.h
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import <Foundation/Foundation.h>

//词典类型
typedef NS_ENUM(NSInteger, IWApiType) {
    IWApiTypeYouDao = 1, //有道词典
    IWApiTypeJinShan     ///金山词典
};

@interface IW_WordBaseModel : NSObject

@property (nonatomic, copy) NSString *word;
@property (nonatomic, copy) NSString *wordId;
@property (nonatomic, strong) NSArray *explains;
@property (nonatomic, copy , readonly)  NSString *explainString;
@property (nonatomic, copy ,readonly)  NSString *compactExplainString; //today widget下compact模式没有换行的解释
@property (nonatomic, copy) NSString *phoneticAM; //美式音标
@property (nonatomic, copy) NSString *phoneticUK; //英式音标
/**/
@property (nonatomic, strong) NSDate *createTime;
@property (nonatomic, assign) NSInteger times; //遇到的次数
@property (nonatomic, copy) NSString *prefixLetter; //首字母

+ (instancetype)modelWithDict:(NSDictionary*)dict;

@end
