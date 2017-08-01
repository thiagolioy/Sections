//
//  LISCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "LISCellBuilder.h"
#import "LISCell.h"

@implementation LISCellBuilder

-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [LISCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    LISCell *cell = (LISCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[LISCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [LISCell sizeWithin:bounds
                   withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
