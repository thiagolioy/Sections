//
//  SaldoCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoCellBuilder.h"
#import "SaldoCell.h"

@interface SaldoCellBuilder ()
@property(nonatomic, weak, nullable) id<CellDelegate> delegate;
@end

@implementation SaldoCellBuilder

-(instancetype)initWithCellDelegate:(id<CellDelegate>) cellDelegate {
    self = [super init];
    if(self) {
        self.delegate = cellDelegate;
    }
    return self;
}
-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [SaldoCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    SaldoCell *cell = (SaldoCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[SaldoCell cellIdentifier] forIndexPath:indexPath];
    cell.delegate = self.delegate;
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [SaldoCell sizeWithin:bounds
                     withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end

