//
//  JNifeTagLabelLayout.m
//  J-nife
//
//  Created by Tesla_Chen on 2017/4/13.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "JNifeTagLabelLayout.h"

/** 每一列之间的间距 */
static const CGFloat XHLDefaultColumnMargin = 10.0;
/** 每一行之间的间距 */
static const CGFloat XHLDefaultRowMargin = 10.0;
/** 边缘间距 */
static const UIEdgeInsets XHLDefaultEdgeInsets = {10, 10, 10, 10};

@interface JNifeTagLabelLayout ()

/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
/** 存放所有列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;
/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;

/** 内容的宽度 */
@property (nonatomic, assign) CGFloat itemMaxX;

/** item的最大高度 */
@property (nonatomic, assign) CGFloat itemMaxHeight;

@end

@implementation JNifeTagLabelLayout

#pragma mark - 代理数据处理
- (CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterflowLayout:)]) {
        return [self.delegate rowMarginInWaterflowLayout:self];
    } else {
        return XHLDefaultRowMargin;
    }
}

- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterflowLayout:)]) {
        return [self.delegate columnMarginInWaterflowLayout:self];
    } else {
        return XHLDefaultColumnMargin;
    }
}


- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetsInWaterflowLayout:)]) {
        return [self.delegate edgeInsetsInWaterflowLayout:self];
    } else {
        return XHLDefaultEdgeInsets;
    }
}


- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

/**
 * 初始化
 */
- (void)prepareLayout
{
    [super prepareLayout];
    self.itemMaxX = 20;
    self.itemMaxHeight = 10;
    
    
    // 清除之前所有的布局属性
    [self.attrsArray removeAllObjects];
    // 开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/**
 * 决定cell的排布
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
    }
    
    // 创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    //通过代理拿到item的宽高
    CGSize itemSize = [self.delegate tagLabels:self indexPath:indexPath];
    //itemSize 宽度大于剩余宽度
    if (collectionViewW - self.itemMaxX - self.edgeInsets.right < itemSize.width ) {
        self.itemMaxX = self.columnMargin;
        self.itemMaxHeight += itemSize.height + self.columnMargin;
    }else{ //itemSize 宽度小于剩余宽度
        if (self.itemMaxX != 10) {
            self.itemMaxX += self.rowMargin;
        }
        
        if (self.itemMaxHeight == 10) {
            self.itemMaxHeight += self.edgeInsets.top - 10;
        }
    }
    
    attrs.frame = CGRectMake(self.itemMaxX, self.itemMaxHeight, itemSize.width, itemSize.height);
    
    // 设置最大宽度
    self.itemMaxX = CGRectGetMaxX(attrs.frame);
    self.contentHeight = self.itemMaxHeight + itemSize.height;
    return attrs;
}

- (CGSize)collectionViewContentSize
{
    
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}




@end
