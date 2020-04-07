//
//  NSString+BoundingRect.m
//  LabelHeight
//
//  Created by HK on 2017/10/17.
//  Copyright © 2017年 HK. All rights reserved.
//

#import "NSString+BoundingRect.h"

@implementation NSString (BoundingRect)

- (BOOL)hk_containsChinese{
    for (int i=0; i<self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4E00 <= ch  && ch <= 0x9FA5) {
            return YES;
        }
    }
    return NO;
}

@end
