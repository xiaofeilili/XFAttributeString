//
//  XFAttributeString.m
//  AttributeStringDemo
//
//  Created by xiaofei on 2017/12/21.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "XFAttributeString.h"

@implementation XFAttributeString

/**富文本设置文本字体大小和颜色*/
+ (NSAttributedString *)attributeStringWithString:(NSString *)string WithSubStrings:(NSArray *)subStrings {
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    for (NSDictionary *subStringDict in subStrings) {
        NSRange range = [string rangeOfString:subStringDict[@"subStr"]];
        UIColor *color = subStringDict[@"color"];
        if (color) {
            [mStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        UIFont *font = subStringDict[@"font"];
        if (font) {
            [mStr addAttribute:NSFontAttributeName value:font range:range];
        }
    }
    
    return mStr;
}

/**富文本设置段落：行间距*/
+ (NSAttributedString *)attributeParagraphStyleStringWithString:(NSString *)string Linespace:(CGFloat)lineSpace {
    NSAttributedString *aStr = [XFAttributeString attributeParagraphStyleStringWithString:string Linespace:lineSpace paragraphSpacing:lineSpace];
    return aStr;
}

/**富文本设置段落：行间距，段间距*/
+ (NSAttributedString *)attributeParagraphStyleStringWithString:(NSString *)string Linespace:(CGFloat)lineSpace paragraphSpacing:(CGFloat)paragraphSpacing {
    NSMutableAttributedString *aStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;         // 行间距
    paragraphStyle.paragraphSpacing = paragraphSpacing;            // 段间距
    paragraphStyle.alignment = NSTextAlignmentCenter;  // 居中显示
    
    [aStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    
    return aStr;
}

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width linespace:(CGFloat)linespace {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = linespace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

@end
