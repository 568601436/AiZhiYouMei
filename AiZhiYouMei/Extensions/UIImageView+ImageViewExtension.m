//
//  UIImageView+ImageViewExtension.m
//  OSell
//
//  Created by DongShaoHua on 15-2-4.
//  Copyright (c) 2015年 DZSOIN. All rights reserved.
//

#import "UIImageView+ImageViewExtension.h"

@implementation UIImageView (ImageViewExtension)

- (void)loadImage:(NSString *)url placeholder:(UIImage *)placeholder
{
    NSString *path = [CGFileHelp getImagePathWithUrl: [NSURL URLWithString:url]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
    {
        NSData *data = [NSData dataWithContentsOfFile: path];
        
        UIImage *image = nil;
        
        if (data && data.length > 0)
        {
            image = [UIImage imageWithData: data];
        }
        else
        {
            dispatch_sync(dispatch_get_main_queue(), ^
            {
                self.image = placeholder;
            });
            
            data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
            
            if (data && data.length > 0)
            {
                [data writeToFile: path atomically: YES];
                image = [UIImage imageWithData: data];
            }
            else
            {
                return ;
            }
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^
        {
            self.image = image;
        });
    });
    
}

- (void)setFaceStyle
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithRed:205/255.0f green:205/255.0f blue:205/255.0f alpha:1].CGColor;
}

@end
