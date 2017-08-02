//
//  SaldoExpandedCardSectionCell.m
//  Experiments
//
//  Created by Thiago Lioy on 24/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoExpandedCardSectionCell.h"
#import "PriceCell.h"
#import "ActionsCell.h"
#import "WhiteSpaceCell.h"
#import "SaldoCellBuilder.h"
#import "PriceCellBuilder.h"
#import "WhiteSpaceCellBuilder.h"
#import "LISCellBuilder.h"
#import "LISUtilizadoBuilder.h"
#import "SaldoLISBuilder.h"
#import "ActionsCellBuilder.h"

@interface SaldoExpandedCardSectionCell ()
@property(nonatomic, weak, nullable) id<CellDelegate> delegate;
@end

@implementation SaldoExpandedCardSectionCell

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
                          [[PriceCellBuilder alloc] init],
                          [[WhiteSpaceCellBuilder alloc] init],
                          [[LISCellBuilder alloc] init],
                          [[WhiteSpaceCellBuilder alloc] init],
                          [[LISUtilizadoBuilder alloc] init],
                          [[WhiteSpaceCellBuilder alloc] init],
                          [[SaldoLISBuilder alloc] init],
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
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView *)collectionView {
    id<CellBuilderProtocol> builder = self.cellBuilders[indexPath.row];
    return [builder sizeWithin:collectionView.bounds];
}

-(UICollectionViewCell *)sectionItemCellAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView *)collectionView {
    id<CellBuilderProtocol> builder = self.cellBuilders[indexPath.row];
    return [builder cellForItemAtIndexPath:indexPath inCollectionView:collectionView];
}


@end

