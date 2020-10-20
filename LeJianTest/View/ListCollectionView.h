//
//  ListCollectionView.h
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//
@protocol ListCollectionViewDelegate <NSObject>

/*
 当点击指定的Cell时调用
 */
-(void)selectCellIndexpath:(NSIndexPath *_Nullable)indexPath;

@end

#import <UIKit/UIKit.h>
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListCollectionView : UICollectionView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)NSArray *collectionArray;

@property(nonatomic, weak)id<ListCollectionViewDelegate> myDelegate;

@end

NS_ASSUME_NONNULL_END
