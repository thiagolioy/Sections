//
//  PendenciasCellBuilder.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/27/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PendenciasCellBuilder.h"
#import "PendenciasCell.h"

@implementation PendenciasCellBuilder

-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [PendenciasCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    PendenciasCell *cell = (PendenciasCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[PendenciasCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [PendenciasCell sizeWithin:bounds
                          withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
