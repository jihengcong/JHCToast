//
//  TestViewController.m
//  JHCToast
//
//  Created by mac on 2020/10/23.
//

#import "TestViewController.h"
#import "JHCPageControl.h"


@interface TestViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) JHCPageControl *pageControl;

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / _scrollView.bounds.size.width;
    _pageControl.currentPage = index;
}


#pragma mark -- 懒加载
- (UIScrollView *)scrollView
{
    if (_scrollView) return _scrollView;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 400)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor brownColor]];
    for (int i = 0; i < colorArray.count; i ++)
    {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(i*_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        bgView.backgroundColor = colorArray[i];
        [_scrollView addSubview:bgView];
    }
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width * 3, _scrollView.bounds.size.height);
    return _scrollView;
}

- (JHCPageControl *)pageControl
{
    if (_pageControl) return _pageControl;
    _pageControl = [[JHCPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scrollView.frame) - 40, self.view.bounds.size.width, 30)];
    _pageControl.numberOfPages = 3;
    _pageControl.userInteractionEnabled = NO;
    
    if (@available(iOS 14.0, *)) {
        _pageControl.currentImage = [UIImage imageNamed:@"launch_guide_select"];
        _pageControl.normalImage = [UIImage imageNamed:@"launch_guide_normal"];
        _pageControl.currentPage = 0;
    } else {
        // Fallback on earlier versions
        [_pageControl setValue:[UIImage imageNamed:@"launch_guide_select"] forKeyPath:@"_currentPageImage"];
        [_pageControl setValue:[UIImage imageNamed:@"launch_guide_normal"] forKeyPath:@"_pageImage"];
    }
    
    return _pageControl;
}


@end
