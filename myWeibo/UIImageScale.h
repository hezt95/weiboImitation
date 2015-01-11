//
//  UIImageScale.h
//  myWeibo
//
//  Created by HeZitong on 14/11/6.
//  Copyright (c) 2014年 HeZitong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageScale)
-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;
@end
