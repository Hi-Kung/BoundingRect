//
//  ViewController.m
//  BoundingRect
//
//  Created by HK on 17/11/5.
//  Copyright © 2017年 HK. All rights reserved.
//

#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]


#import "ViewController.h"
#import "NSAttributedString+BoundingRect.h"
#import "NSString+BoundingRect.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIFont *bigFont = [UIFont systemFontOfSize:18];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 4;
//    style.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSString *str = @"从她分享的照片和贴文中不难看";

//    NSString *str = @"从她分享的照片和贴文中不难看出对警察工作的热爱从她分享的照片和贴文中不难看出对警察工作的热爱";
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attrStr.length)];
    [attrStr addAttribute:NSFontAttributeName value:bigFont range:NSMakeRange(0, attrStr.length)];
    
    [self testLabelSizeFit:attrStr];
    
    [self testBoundingMethod:attrStr paragraphStyle:style];
    
}

- (void)testBoundingMethod:(NSMutableAttributedString *)attStr paragraphStyle:(NSMutableParagraphStyle *)style{
    CGSize labelSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-16*2, MAXFLOAT);
    UIFont *bigFont = [UIFont systemFontOfSize:18];
    
    NSUInteger lineNumber = 2;
    
    CGSize rectInfo = [attStr hk_boundingRectWithMaxSize:labelSize font:bigFont paragraphStyle:style maxLineNumber:lineNumber];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 100, labelSize.width, rectInfo.height)];
    label.backgroundColor = RGB(73, 201, 201);
    label.numberOfLines = lineNumber;
    label.attributedText = attStr;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.view addSubview:label];
}

- (void)testLabelSizeFit:(NSAttributedString *)attStr{
    CGSize labelSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-16*2, MAXFLOAT);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 300, 0, 0)];
    label.backgroundColor = RGB(73, 201, 201);
    label.numberOfLines = 2;
    label.attributedText = attStr;
    CGSize size = [label sizeThatFits:labelSize]; // 一行时宽度限制不了 行间距会保留
    label.frame = CGRectMake(16, 300, size.width, size.height);
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
