//
//  UIViewController+coolStyle.m
//  navigationTitleView
//
//  Created by zhn on 16/5/31.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "UIViewController+coolStyle.h"
#import "UINavigationBar+coolStyle.h"
#import <objc/runtime.h>
// 方法交换
void exchangeMehtod(Class class,SEL originalSel,SEL newSel){
    
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    
    BOOL success = class_addMethod(class, originalSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (success) {
        class_replaceMethod(class, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@implementation UIViewController (coolStyle)
+ (void)load{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        Class class = [self class];
        //
        SEL viewDisAppearOriginalSEL = @selector(viewWillDisappear:);
        SEL viewDisAppearNewSEL = @selector(zhn_viewWillDisappear:);
        
        exchangeMehtod(class, viewDisAppearOriginalSEL, viewDisAppearNewSEL);
    });
}


- (void)zhn_viewWillDisappear:(BOOL)animated{
    
    [self zhn_viewWillDisappear:animated];
    // 要重置一下
    [self.navigationController.navigationBar zhn_reset];
}




@end
