//
//  UINavigationBar+coolStyle.m
//  navigationTitleView
//
//  Created by zhn on 16/5/31.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "UINavigationBar+coolStyle.h"
#include <objc/runtime.h>

@implementation UINavigationBar (coolStyle)


- (void)zhn_setBackGroundColor:(UIColor *)color{
    self.barTintColor = color;
}

- (void)zhn_setBackGroundAlpha:(CGFloat)alpha{
    [self.subviews firstObject].alpha = alpha;
}

- (void)zhn_setTransLationY:(CGFloat)transLationY{
    self.transform = CGAffineTransformMakeTranslation(0, transLationY);
}

- (void)zhn_reset{
    [self.subviews firstObject].alpha = 1;
    self.transform = CGAffineTransformIdentity;
}


@end
