//
//  JNifeTagLabelLayout.h
//  J-nife
//
//  Created by Tesla_Chen on 2017/4/13.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JNifeTagLabelsLayoutDelegate <NSObject>

@required

- (CGSize)tagLabels:(UICollectionViewLayout *)tagLabels indexPath:(NSIndexPath *)indexPath;

@optional
/**
 *  行间距
 */
- (CGFloat)rowMarginInWaterflowLayout:(UICollectionViewLayout*)layout;
/**
 *  列间距
 */
- (CGFloat)columnMarginInWaterflowLayout:(UICollectionViewLayout*)layout;
/**
 *  collectionView内边距
 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(UICollectionViewLayout*)layout;


@end

@interface JNifeTagLabelLayout : UICollectionViewLayout

@property(nonatomic, weak)id<JNifeTagLabelsLayoutDelegate>  delegate;

@end
