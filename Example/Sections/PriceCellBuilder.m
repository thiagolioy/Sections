//
//  PriceCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PriceCellBuilder.h"
#import "PriceCell.h"

@implementation PriceCellBuilder

-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [PriceCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    PriceCell *cell = (PriceCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[PriceCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [PriceCell sizeWithin:bounds
                     withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
