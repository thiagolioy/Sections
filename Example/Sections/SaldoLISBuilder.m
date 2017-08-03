//
//  SaldoLISBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoLISBuilder.h"
#import "SaldoLISCell.h"

@implementation SaldoLISBuilder

-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [SaldoLISCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    SaldoLISCell *cell = (SaldoLISCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[SaldoLISCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [SaldoLISCell sizeWithin:bounds
                        withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
