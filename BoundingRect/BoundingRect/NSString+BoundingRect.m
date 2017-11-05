//
//  NSString+BoundingRect.m
//  LabelHeight
//
//  Created by HK on 2017/10/17.
//  Copyright © 2017年 HK. All rights reserved.
//

#import "NSString+BoundingRect.h"

@implementation NSString (BoundingRect)

- (CGSize)boundingRectWithMaxSize:(CGSize)maxSize
                          font:(UIFont *)font
                 maxLineNumber:(NSUInteger)maxLineNumber
{
    if (font==nil || self==nil) {
        return CGSizeZero;
    }
    
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    
    if (maxLineNumber>0){
        CGFloat maxHeight = maxLineNumber * font.lineHeight;
        
        if (rect.size.height > maxHeight){
            return CGSizeMake(rect.size.width, maxHeight);
        }
    }
    return rect.size;
}

- (BOOL)containsChinese{
    for (int i=0; i<self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4E00 <= ch  && ch <= 0x9FA5) {
            return YES;
        }
    }
    return NO;
}

@end
