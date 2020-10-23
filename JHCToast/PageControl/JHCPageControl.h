//
//  JHCPageControl.h
//  btex
//
//  Created by mac on 2020/9/3.
//  Copyright © 2020 btex.me. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface JHCPageControl : UIPageControl

/** 未选中的原点颜色 */
@property (nonatomic, strong) UIColor *normalColor;
/** 当前选中的原点颜色 */
@property (nonatomic, strong) UIImage *currentColor;

/** 未选中的图片 */
@property (nonatomic, strong) UIImage *normalImage;
/** 当前选中的图片 */
@property (nonatomic, strong) UIImage *currentImage;


@end

NS_ASSUME_NONNULL_END
