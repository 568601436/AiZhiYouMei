//
//  BaseVC.m
//  AiZhiYouMei
//
//  Created by OSellMobile on 16/1/12.
//  Copyright © 2016年 CGMobile. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setBackButton
{
    [self setBarButton: @"icon_return.png" frame: CGRectMake(0, 0, 12, 22) isright: NO];
}
- (void)setNavigationButton:(RightButtonType)type{
    NSString *imagename = nil;
    switch (type)
    {
        case Done:
            imagename = @"";
            break;
        default:
            break;
    }
    
    if (![NSString isNullOrEmpty: imagename])
    {
        [self setBarButton: imagename frame: CGRectMake(0.0, 0.0, 25.0, 20.0) isright: YES];
    }
    
}
- (void)setBarButton:(NSString *)imagename frame:(CGRect)frame isright:(BOOL)isright
{
    UIImage *img = [UIImage imageNamed: imagename];
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage: img forState: UIControlStateNormal];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView: button];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    flexItem.width=60;
    if (isright)
    {
        [button addTarget: self action: @selector(rightBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItems=[NSArray arrayWithObjects:barButton,flexItem, nil];
        //self.navigationItem.rightBarButtonItem = barButton;
    }
    else
    {
        [button addTarget: self action: @selector(leftBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItems=[NSArray arrayWithObjects:barButton,flexItem, nil];
        //self.navigationItem.leftBarButtonItem = barButton;
    }
}

- (void)leftBarButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)rightBarButtonClick:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
