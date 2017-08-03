//
//  WhiteSpaceCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "WhiteSpaceCellBuilder.h"
#import "WhiteSpaceCell.h"

@implementation WhiteSpaceCellBuilder

-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [WhiteSpaceCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    WhiteSpaceCell *cell = (WhiteSpaceCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[WhiteSpaceCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [WhiteSpaceCell sizeWithin:bounds
                          withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end

