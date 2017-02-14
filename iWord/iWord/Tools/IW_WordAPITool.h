//
//  IW_WordAPITools.h
//  iWord
//
//  Created by kanewang on 2017/2/14.
//  Copyright © 2017年 shuige. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IW_SharedTool.h"
#import "IW_WordBaseModel.h"

typedef void (^ResultBlock) (IW_WordBaseModel *resultModel , NSError *error);

@interface IW_WordAPITool : NSObject

+ (instancetype)sharedTool;

- (void)queryWord:(NSString*)word withApiType:(IWApiType)apiType resultHandle:(ResultBlock)resultBlock;

- (void)queryWord:(NSString*)word resultHandle:(ResultBlock)resultBlock;

@end
