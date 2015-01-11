//
//  HomeModel.h
//  myWeibo
//
//  Created by HeZitong on 14/11/9.
//  Copyright (c) 2014年 HeZitong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic,copy) NSString *weiboImage;
@property (nonatomic,copy) NSString *weiboUsersName;
@property (nonatomic,copy) NSString *weiboSource;
@property (nonatomic,copy) NSString *weiboContent;
@property (nonatomic,assign) NSInteger weiboForwardNum;
@property (nonatomic,assign) NSInteger weiboReplyNum;
@property (nonatomic,assign) NSInteger weiboZanNum;
@property (nonatomic,assign) NSString *weiboForwardImage;
@property (nonatomic,assign) NSString *weiboReplyImage;
@property (nonatomic,assign) NSString *weiboZanImage;

@end
