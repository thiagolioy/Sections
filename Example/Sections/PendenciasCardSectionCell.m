//
//  PendenciasCardSectionCell.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/27/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PendenciasCardSectionCell.h"
#import "PendenciasCell.h"
#import "PendenciasCellBuilder.h"

@implementation PendenciasCardSectionCell
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
                          [[PendenciasCellBuilder alloc] init]

                          ];
    self.cellBuilders = builders;
    for(id<CellBuilderProtocol> builder in self.cellBuilders) {
        [builder registerCellInCollectionView:collectionView];
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
