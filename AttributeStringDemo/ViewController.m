//
//  ViewController.m
//  AttributeStringDemo
//
//  Created by xiaofei on 2017/12/21.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "XFAttributeString.h"
#import "PrefixHeader.pch"

#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *str = @"100元";
    
//    NSArray *arr = @[@{@"subStr":@"元", @"color":[UIColor cyanColor], @"font":[UIFont systemFontOfSize:28]}];
//    NSAttributedString *aStr = [XFAttributeString attributeStringWithString:str WithSubStrings:arr];
    
    NSAttributedString *aStr = [XFAttributeString attributeParagraphStyleStringWithString:@"lsiejofskjowiuefhsknd\nosjfpa;jljvoerifjsoljdsd" Linespace:10];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 400)];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor cyanColor];
    [label setAttributedText:aStr];
    [self.view addSubview:label];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 200, 50, 50);
    btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(exitApplication) forControlEvents:UIControlEventTouchUpInside];
    
    
        
    
}

- (void)exitApplication {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
    } completion:^(BOOL finished) {
        exit(0);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
