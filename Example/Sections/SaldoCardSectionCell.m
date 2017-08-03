//
//  SaldoCardSectionCell.m
//  Experiments
//
//  Created by Thiago Lioy on 24/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoCardSectionCell.h"
#import "ActionsCell.h"
#import "PriceCell.h"
#import "WhiteSpaceCell.h"

#import "SaldoCellBuilder.h"
#import "WhiteSpaceCellBuilder.h"
#import "ActionsCellBuilder.h"

@interface SaldoCardSectionCell ()
@property(nonatomic, weak, nullable) id<CellDelegate> delegate;
@end
@implementation SaldoCardSectionCell

@synthesize cellBuilders;

-(instancetype)initWithCellDelegate:(id<CellDelegate>) cellDelegate {
    self = [super init];
    if(self) {
        self.delegate = cellDelegate;
        [self setupCellBuilders];
    }
    return self;
}

-(void)setupCellBuilders {
    NSArray *builders = @[
                         [[SaldoCellBuilder alloc] initWithCellDelegate:self.delegate],
                         [[WhiteSpaceCellBuilder alloc] init],
                         [[ActionsCellBuilder alloc] initWithCellDelegate:self.delegate]
                         ];
    self.cellBuilders = builders;
}

-(void)registerCellsForBuildersInCollectionView:(UICollectionView *)collectionView {
    for(id<CellBuilderProtocol> builder in self.cellBuilders) {
        [builder registerCellInCollectionView:collectionView];
    }
}


-(NSInteger)numberOfItems {
    return self.cellBuilders.count;
}

-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    id<CellBuilderProtocol> builder = self.cellBuilders[indexPath.row];
    return [builder sizeWithin:collectionView.bounds];
}
-(UICollectionViewCell *)sectionItemCellAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    id<CellBuilderProtocol> builder = self.cellBuilders[indexPath.row];
    return [builder cellForItemAtIndexPath:indexPath inCollectionView:collectionView];
}

@end
