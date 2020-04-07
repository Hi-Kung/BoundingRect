//
//  NSMutableAttributedString+BoundingRect.h
//  LabelHeight
//
//  Created by HK on 2017/10/17.
//  Copyright © 2017年 HK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (BoundingRect)

- (CGSize)hk_boundingRectWithMaxSize:(CGSize)maxSize
                             font:(UIFont *)font
                   paragraphStyle:(NSMutableParagraphStyle *)style
                    maxLineNumber:(NSUInteger)maxLineNumber;

@end
