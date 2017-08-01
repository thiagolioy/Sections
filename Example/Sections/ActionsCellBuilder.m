//
//  ActionsCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "ActionsCellBuilder.h"
#import "ActionsCell.h"

@interface ActionsCellBuilder ()
@property(nonatomic, weak, nullable) id<CellDelegate> delegate;
@end

@implementation ActionsCellBuilder

-(instancetype)initWithCellDelegate:(id<CellDelegate>) cellDelegate {
    self = [super init];
    if(self) {
        self.delegate = cellDelegate;
    }
    return self;
}
-(void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [ActionsCell registerForCollectionView:collectionView];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    
    ActionsCell *cell = (ActionsCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[ActionsCell cellIdentifier] forIndexPath:indexPath];
    cell.delegate = self.delegate;
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [ActionsCell sizeWithin:bounds
                       withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
