//
//  LISUtilizadoBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "LISUtilizadoBuilder.h"
#import "LISUtilizadoCell.h"

@implementation LISUtilizadoBuilder

-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [LISUtilizadoCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    LISUtilizadoCell *cell = (LISUtilizadoCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[LISUtilizadoCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [LISUtilizadoCell sizeWithin:bounds
                            withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end

