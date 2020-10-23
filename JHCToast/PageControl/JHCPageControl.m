//
//  JHCPageControl.m
//  btex
//
//  Created by mac on 2020/9/3.
//  Copyright © 2020 btex.me. All rights reserved.
//

#import "JHCPageControl.h"


#define kPointSelectWidth  20
#define kPointWidth  10
#define kPointHeight 10

@implementation JHCPageControl


// 重写
- (void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    
    if (@available(iOS 14.0, *)) {
        
        UIView *controlContentView = self.subviews.firstObject;
        UIView *controlIndicatorContentView = controlContentView.subviews.firstObject;
        UIView *IndicatorView = controlIndicatorContentView.subviews.firstObject;
        
        if(IndicatorView && [IndicatorView isKindOfClass:[UIImageView class]])
        {
            for(int i = 0; i < [controlIndicatorContentView.subviews count]; i++)  {
                
                UIImageView *dot = [controlIndicatorContentView.subviews objectAtIndex:i];
                [dot.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                dot.backgroundColor = [UIColor clearColor];
                
                if (i == self.currentPage) {
                    dot.frame = CGRectMake(dot.frame.origin.x, dot.frame.origin.y, kPointSelectWidth, kPointHeight);
                    dot.image = self.currentImage;
                } else {
                    dot.frame = CGRectMake(dot.frame.origin.x, dot.frame.origin.y, kPointWidth, kPointHeight);
                    dot.image = self.normalImage;
                }
            }
        }
    } else {
        for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++)
        {
            UIView *subview = [self.subviews objectAtIndex:subviewIndex];
            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y, (subviewIndex == currentPage ? kPointSelectWidth : kPointWidth), kPointHeight)];
        }
    }
}


#pragma mark -- setter方法
- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
}

- (void)setCurrentColor:(UIImage *)currentColor
{
    _currentColor = currentColor;
}

- (void)setNormalImage:(UIImage *)normalImage
{
    _normalImage = normalImage;
}

- (void)setCurrentImage:(UIImage *)currentImage
{
    _currentImage = currentImage;
}



@end
