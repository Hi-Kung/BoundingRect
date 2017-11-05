//
//  NSString+BoundingRect.h
//  LabelHeight
//
//  Created by HK on 2017/10/17.
//  Copyright © 2017年 HK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BoundingRect)

- (BOOL)containsChinese;
- (CGSize)boundingRectWithMaxSize:(CGSize)maxSize
                             font:(UIFont *)font
                    maxLineNumber:(NSUInteger)maxLineNumber;

@end
