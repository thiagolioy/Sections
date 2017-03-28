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



@implementation SaldoCardSectionCell

@synthesize delegate, cellBuilders, collection;


-(instancetype)initWithCollectionView:(UICollectionView*)collectionView andCellDelegate:(id<CellDelegate>) cellDelegate{
    self = [super init];
    if(self) {
        self.collection = collectionView;
        self.delegate = cellDelegate;
        [self setupCellBuildersFor:collectionView];
    }
    return self;
}

-(void)setupCellBuildersFor:(UICollectionView*)collectionView{
    NSArray *builders = @[
                         [[SaldoCellBuilder alloc] initWithCollectionView:collectionView andCellDelegate:self.delegate],
                         [[WhiteSpaceCellBuilder alloc] initWithCollectionView:collectionView],
                         [[ActionsCellBuilder alloc] initWithCollectionView:collectionView andCellDelegate:self.delegate]
                         ];
    self.cellBuilders = builders;
    for(id<CellBuilderProtocol> builder in self.cellBuilders) {
        [builder registerCell];
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
    return [builder cellForItemAtIndexPath:indexPath];
}

@end
