//
//  XFAttributeString.h
//  AttributeStringDemo
//
//  Created by xiaofei on 2017/12/21.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFAttributeString : NSObject
/**富文本设置文本字体大小和颜色*/
+ (NSAttributedString *)attributeStringWithString:(NSString *)string WithSubStrings:(NSArray *)subStrings;
/**富文本设置段落：行间距*/
+ (NSAttributedString *)attributeParagraphStyleStringWithString:(NSString *)string Linespace:(CGFloat)lineSpace;
/**富文本设置段落：行间距，段间距*/
+ (NSAttributedString *)attributeParagraphStyleStringWithString:(NSString *)string Linespace:(CGFloat)lineSpace paragraphSpacing:(CGFloat)paragraphSpacing;

@end
