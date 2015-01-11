//
//  HomeTableViewCell.h
//  myWeibo
//
//  Created by HeZitong on 14/11/29.
//  Copyright (c) 2014年 HeZitong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageScale.h"
@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,retain) UIImageView *usersImageView;
@property(nonatomic,retain) UILabel *usersNameLabel;
@property(nonatomic,retain) UILabel *sourceLabel;
@property(nonatomic,retain) UILabel *contentLabel;
@property(nonatomic,retain) UILabel *forwardNumLabel;
@property(nonatomic,retain) UILabel *replyNumLabel;
@property(nonatomic,retain) UILabel *zanNumLabel;
@property(nonatomic,retain) UIButton *forwardButton;
@property(nonatomic,retain) UIButton *replyButton;
@property(nonatomic,retain) UIButton *zanButton;

-(void)setContentText:(NSString*) content;
-(id)initWithReusedIdentifier:(NSString *) reusedIdentifier;

@end
