//
//  ListCollectionViewCell.h
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *countLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;

-(void)updateCell:(ListModel *)result;

@end

NS_ASSUME_NONNULL_END
