//
//  JHCViewController.m
//  JHCToast
//
//  Created by mac on 2020/10/21.
//

#import "JHCViewController.h"
#import "TestViewController.h"
#import "JHCToastHud.h"


@interface JHCViewController ()

@end

@implementation JHCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)startAction:(UIButton *)button
{
//    [JHCToastHud showLoadingWithMsg:nil inView:button.superview];
    
    [JHCToastHud showLoadingWithMsg:@"加载中" inView:button.superview];
}

- (IBAction)stopAction:(UIButton *)button
{
    [JHCToastHud hideAnimated:YES];
    
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
