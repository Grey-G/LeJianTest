//
//  ListCollectionViewCell.m
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/20.
//  Copyright © 2020 Grey. All rights reserved.
//

#import "ListCollectionViewCell.h"

@implementation ListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)updateCell:(ListModel *)result
{
    [self.photo sd_setImageWithURL:[NSURL URLWithString:result.image] placeholderImage:[UIImage imageNamed:DEFAULTPICTURE]];
    self.nameLb.text = result.name;
    self.countLb.text = [NSString stringWithFormat:@"整盒%@个", result.styleCount];
    self.priceLb.text = [NSString stringWithFormat:@"¥%@", result.price];
}

@end
