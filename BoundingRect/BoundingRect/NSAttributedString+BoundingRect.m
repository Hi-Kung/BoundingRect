//
//  NSMutableAttributedString+BoundingRect.m
//  LabelHeight
//
//  Created by HK on 2017/10/17.
//  Copyright © 2017年 HK. All rights reserved.
//

#import "NSAttributedString+BoundingRect.h"
#import "NSString+BoundingRect.h"


@implementation NSMutableAttributedString (BoundingRect)

- (CGSize)boundingRectWithMaxSize:(CGSize)maxSize
                             font:(UIFont *)font
                   paragraphStyle:(NSMutableParagraphStyle *)style
                    maxLineNumber:(NSUInteger)maxLineNumber
{
    if (font==nil || self==nil) {
        return CGSizeZero;
    }
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [self boundingRectWithSize:maxSize options:options context:nil];
    
    CGFloat lineSpacing = style?style.lineSpacing:0;
    
    if ((rect.size.height - font.lineHeight) <= lineSpacing &&
        [self.string containsChinese]) {
        // 只有一行且包含中文 减去行间距
        if (style) {
            style.lineSpacing = 0;
            [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
        }
        rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-lineSpacing);

        return rect.size;
        
    }else if (maxLineNumber>0){
        CGFloat maxHeight = maxLineNumber * (font.lineHeight+lineSpacing)-lineSpacing;
        
        if (rect.size.height > maxHeight){
            rect.size.height = maxHeight;
            return rect.size;
        }
    }

    return rect.size;
}



@end
