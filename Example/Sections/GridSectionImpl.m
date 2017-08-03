//
//  GridSectionImpl.m
//  Experiments
//
//  Created by Thiago Lioy on 28/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "GridSectionImpl.h"
#import "GridCollectionViewCell.h"
#import "CollectionViewReusableHeader.h"

@implementation GridSectionImpl

@synthesize sectionDelegate;

-(instancetype)initWithSectionDelegate:(id<SectionDelegate>) delegate{
    self = [super init];
    if(self) {
        self.sectionDelegate = delegate;
    }
    return self;
}

-(void)registerCellsForBuildersInCollectionView:(UICollectionView *)collectionView {
    [GridCollectionViewCell registerForCollectionView:collectionView];
    [CollectionViewReusableHeader registerHeaderCellIn:collectionView];
}

-(NSInteger)numberOfItems {
    return self.items.count;
}
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    return [GridCollectionViewCell cellSize];
}
-(UICollectionViewCell*)sectionItemCellAtIndexPath:(NSIndexPath*) indexPath inCollectionView:(UICollectionView * _Nonnull)collectionView {
    GridCollectionViewCell *cell = (GridCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[GridCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    NSLog(@"%@", [self.items objectAtIndex:indexPath.row]);
    return cell;
}

-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)index inCollectionView:(UICollectionView *)collectionView {
    return 5.0;
}

-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger) index inCollectionView:(UICollectionView *)collectionView {
    return 5.0;
}

-(UIEdgeInsets)insetForSectionAtIndex {
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

-(CGSize)sectionHeaderSizeInCollectionView:(UICollectionView *)collectionView {
       return CGSizeMake(collectionView.bounds.size.width, 50);
}

-(UICollectionReusableView*)sectionHeaderCellAtIndexPath:(NSIndexPath*) indexPath inCollectionView:(UICollectionView *)collectionView {
    CollectionViewReusableHeader *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionViewReusableHeader cellIdentifier] forIndexPath:indexPath];
    NSString *title = [NSString stringWithFormat:@"Section Title: %@", @(indexPath.section)];
    [reusableview setupWith:title];
    
    return reusableview;
}

-(void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath inCollectionView:(UICollectionView *)collectionView {
    if(self.sectionDelegate) {
        [self.sectionDelegate didSelectSectionItemAtIndex:indexPath.row
                                         inSection:self];
    }
}

@end
