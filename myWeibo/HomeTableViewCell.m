//
//  HomeTableViewCell.m
//  myWeibo
//
//  Created by HeZitong on 14/11/29.
//  Copyright (c) 2014年 HeZitong. All rights reserved.
//x

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell
-(id)initWithReusedIdentifier:(NSString *)reusedIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:reusedIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}

-(void)setContentText:(NSString *)content{
    CGRect frame = [self frame];//获取当前cell高度
    NSLog(@"%@", NSStringFromCGRect(frame));
    self.contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.contentLabel.text = content;

    self.contentLabel.numberOfLines = 6;
    
    
    CGSize size = CGSizeMake(300, MAXFLOAT);
    CGRect textRect = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    CGSize labelSize = textRect.size;
    frame.size.height = labelSize.height>6*18? 6*18: labelSize.height;
    self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, labelSize.width, frame.size.height);
    
    CGRect forwardButtonRect = CGRectMake(30,60+frame.size.height, 15, 15);
    self.forwardButton.frame = forwardButtonRect;
    CGRect forwardNumLabelRect = CGRectMake(48, 60+frame.size.height, 30, 15);
    self.forwardNumLabel.frame = forwardNumLabelRect;
    CGRect replyButtonRect = CGRectMake(130, 60+frame.size.height, 15, 15);
    self.replyButton.frame = replyButtonRect;
    CGRect replyNumLabelRect = CGRectMake(148, 60+frame.size.height, 30, 15);
    self.replyNumLabel.frame = replyNumLabelRect;
    CGRect zanButtonRect = CGRectMake(230, 60+frame.size.height, 15, 15);
    self.zanButton.frame = zanButtonRect;
    CGRect zanNumLabelRect = CGRectMake(248, 60+frame.size.height, 30, 15);
    self.zanNumLabel.frame = zanNumLabelRect;
    
    frame.size.height += 80;
    self.frame = frame;
    
//    NSLog(@"%f",self.frame.size.height);

}

-(void)initLayout{
    CGRect imageViewRect = CGRectMake(10, 10, 35, 35);
    self.usersImageView = [[UIImageView alloc] initWithFrame:imageViewRect];
    [self addSubview:self.usersImageView];
    CGRect usersNameLabelRect = CGRectMake(60, 5, 250, 30);
    self.usersNameLabel = [[UILabel alloc] initWithFrame:usersNameLabelRect];
    self.usersNameLabel.font = [UIFont boldSystemFontOfSize:15];
    [self addSubview:self.usersNameLabel];
    
    CGRect sourceLabelRect = CGRectMake(60, 35, 100, 10);
    self.sourceLabel = [[UILabel alloc] initWithFrame:sourceLabelRect];
    self.sourceLabel.font = [UIFont fontWithName:@"Menlo" size:10];
    self.sourceLabel.textColor = [UIColor grayColor];
    [self addSubview:self.sourceLabel];
    
    CGRect contentLabelRect = CGRectMake(10, 50, 300, 120);
    self.contentLabel = [[UILabel alloc] initWithFrame:contentLabelRect];
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.contentLabel];
    
    [self.forwardButton removeFromSuperview];
    self.forwardButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.forwardButton setImage:[UIImage imageNamed:@"forward.png"] forState:UIControlStateNormal];
    [self addSubview:self.forwardButton];
    
    [self.forwardNumLabel removeFromSuperview];
    self.forwardNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.forwardNumLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.forwardNumLabel];
    
    [self.replyButton removeFromSuperview];
    self.replyButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.replyButton setImage:[UIImage imageNamed:@"reply.png"] forState:UIControlStateNormal];
    [self addSubview:self.replyButton];
    
    [self.replyNumLabel removeFromSuperview];
    self.replyNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.replyNumLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.replyNumLabel];
    
    [self.zanButton removeFromSuperview];
    self.zanButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.zanButton setImage:[UIImage imageNamed:@"zan.png"] forState:UIControlStateNormal];
    [self addSubview:self.zanButton];
    
    [self.zanNumLabel removeFromSuperview];
    self.zanNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.zanNumLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.zanNumLabel];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}
@end
