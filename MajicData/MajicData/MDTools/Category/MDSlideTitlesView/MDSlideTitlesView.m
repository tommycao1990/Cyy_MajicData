//
//  MDSlideTitlesView.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/24.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "MDSlideTitlesView.h"

static CGFloat const  ButtonSpace  = 50;

@interface MDSlideTitlesView ()<UIScrollViewDelegate>

@property (nonatomic, strong) MDSlideTitlesViewSetting *setting;
@property (nonatomic, strong) NSMutableArray *buttonArr;
@property (nonatomic, strong) NSMutableArray *contentOffsetArr;

@property (nonatomic, assign) CGFloat currentOffset_x;
@property (nonatomic, strong) UIView    *slideLine;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation MDSlideTitlesView

- (NSMutableArray *)buttonArr
{
    if (!_buttonArr) {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
}

- (NSMutableArray *)contentOffsetArr
{
    if (!_contentOffsetArr) {
        _contentOffsetArr = [NSMutableArray array];
    }
    return _contentOffsetArr;
}

- (instancetype)initSlideTitlesViewWithSettings:(MDSlideTitlesViewSetting *)setting {
    self = [super initWithFrame:setting.frame];
    if (self) {
        _setting = setting;
        _currentIndex = setting.currentIndex;
        
        self.backgroundColor = setting.backgroundColor;
        
        NSInteger titlesCount = setting.titles.count;
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, setting.frame.size.width, setting.frame.size.height)];
        scrollView.backgroundColor = setting.backgroundColor;
        
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.bounces = NO;

        
        for (int i = 0; i < titlesCount; i++) {
            UIButton *titleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
            titleButton.backgroundColor = KColor_White;
            NSString *title = setting.titles[i];
            [titleButton.titleLabel setFont:[UIFont systemFontOfSize:setting.currentFont]];
            [titleButton setTitle:title forState:(UIControlStateNormal)];
            
            if (i == setting.currentIndex) {
                [titleButton setTitleColor:setting.selectTitleColor forState:(UIControlStateNormal)];
                titleButton.selected = YES;
                
                _slideLine = [[UIView alloc] init];
                _slideLine.backgroundColor = setting.selectTitleColor;
                _slideLine.frame = CGRectMake(_currentOffset_x + ButtonSpace / 2, setting.frame.size.height - 1, title.length * setting.currentFont, 1);
                [scrollView addSubview:_slideLine];
                
            } else {
                [titleButton setTitleColor:setting.unSelectTitleColor forState:(UIControlStateNormal)];
            }
            CGFloat buttonWidth = title.length * setting.currentFont + ButtonSpace;
            [titleButton setFrame:(CGRectMake(_currentOffset_x, 0, buttonWidth, setting.frame.size.height))];
            [self.contentOffsetArr addObject:[NSNumber numberWithFloat:_currentOffset_x]];//这里保存之后再相加，得到的是下一个button的X
            _currentOffset_x += buttonWidth;
            
            [titleButton addTarget:self action:@selector(titleButttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.buttonArr addObject:titleButton];
            [scrollView addSubview:titleButton];
        }
        [scrollView bringSubviewToFront:_slideLine];

        scrollView.contentSize = CGSizeMake(_currentOffset_x, setting.frame.size.height);

        if (setting.priorityLeftL) {
            CGFloat x = _currentOffset_x > kMainWidth ? _currentOffset_x : kMainWidth;
            [scrollView setContentOffset:(CGPointMake(x - kMainWidth, 0))];
        }
        
        [self addSubview:scrollView];
        
    }
    return self;
}


#pragma mark -- Pravie Method

- (void) titleButttonAction:(UIButton *) sender {
    
    for (UIButton *button in self.buttonArr) {
        button.selected = NO;
    }
    
    sender.selected = YES;
    
    for (UIButton *button in self.buttonArr) {
        if (button.selected) {
            [button setTitleColor:_setting.selectTitleColor forState:(UIControlStateNormal)];
            
            _currentIndex = [self.buttonArr indexOfObject:button];
            
        } else {
            [button setTitleColor:_setting.unSelectTitleColor forState:(UIControlStateNormal)];

        }
    }
    
    CGFloat contentoffset = [[self.contentOffsetArr objectAtIndex:_currentIndex] floatValue];
    
    NSString *title = [_setting.titles objectAtIndex:_currentIndex];
    
    [UIView animateWithDuration:.3f animations:^{
       
        _slideLine.frame = CGRectMake(contentoffset + ButtonSpace/2, _setting.frame.size.height - 1, title.length * _setting.currentFont, 1);
        
    }];
    
    
    if (self.selectTitleBlock) {
        self.selectTitleBlock(_currentIndex);
    }
    
    
}



@end


@implementation MDSlideTitlesViewSetting


@end
