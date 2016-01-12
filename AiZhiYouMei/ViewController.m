//
//  ViewController.m
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/5.
//  Copyright © 2016年 CGMobile. All rights reserved.
//

#import "ViewController.h"
#import "RequestHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *address = [RequestHelper getBaseAdressWith:@"GetMyProductPageList"];
    NSMutableDictionary *productsParameter = [[NSMutableDictionary alloc]init];
    [productsParameter setValue: @"147436" forKey: @"UserID"];
    [productsParameter setValue:@"1" forKey:@"PageIndex"];
    [productsParameter setValue:@"5" forKey:@"PageSize"];
    [productsParameter setValue: @"zh" forKey: @"lan"];
    [RequestHelper requestPOSTServer:address parameters:productsParameter successful:^(id data) {
        NSLog(@"========%@",data);
    } faild:^{
        NSLog(@"失败。。。。。");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
