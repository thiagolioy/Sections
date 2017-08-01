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

@implementation SaldoExpandedCardSectionCell

@synthesize delegate, cellBuilders, collection;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView andCellDelegate:(id<CellDelegate>) cellDelegate{
    self = [super init];
    if(self) {
        collection = collectionView;
        delegate = cellDelegate;
        [self setupCellBuildersFor:collectionView];
    }
    return self;
}

-(void)setupCellBuildersFor:(UICollectionView*)collectionView {
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
    for(id<CellBuilderProtocol> builder in self.cellBuilders) {
        [builder registerCellInCollectionView:collection];
    }
}


-(NSInteger)numberOfItems {
    return self.cellBuilders.count;
}
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath *)indexPath {
    id<CellBuilderProtocol> builder = self.cellBuilders[indexPath.row];
    return [builder sizeWithin:self.collection.bounds];
}

-(UICollectionViewCell *)sectionItemCellAtIndexPath:(NSIndexPath *)indexPath {
    id<CellBuilderProtocol> builder = self.cellBuilders[indexPath.row];
    return [builder cellForItemAtIndexPath:indexPath inCollectionView:self.collection];
}


@end

