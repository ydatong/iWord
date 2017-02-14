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
    IWApiTypeYouDao = 1 //有道词典
};

@protocol IW_WordModelDelegate <NSObject>

+ (instancetype)modelWithDict:(NSDictionary*)dict;

@end

@interface IW_WordBaseModel : NSObject <IW_WordModelDelegate>

@property (nonatomic, copy) NSString *word;
@property (nonatomic, copy) NSString *wordId;


@end
