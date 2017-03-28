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

-(instancetype)initWithCollectionView:(UICollectionView*)collection
                   andSectionDelegate:(id<SectionDelegate>) delegate{
    self = [super init];
    if(self) {
        self.collectionView = collection;
        self.sectionDelegate = delegate;
        [self registerCells];
        [self registerHeaderSectionViewsIn:collection];
    }
    return self;
}

-(void)registerHeaderSectionViewsIn:(UICollectionView*) collection {
    [CollectionViewReusableHeader registerHeaderCellIn:collection];
}

-(void)registerCells {
    [GridCollectionViewCell registerForCollectionView:self.collectionView];
}

-(NSInteger)numberOfItems {
    return self.items.count;
}
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath {
    return [GridCollectionViewCell cellSize];
}
-(UICollectionViewCell*)sectionItemCellAtIndexPath:(NSIndexPath*) indexPath {
    GridCollectionViewCell *cell = (GridCollectionViewCell*)[self.collectionView dequeueReusableCellWithReuseIdentifier:[GridCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    NSLog(@"%@", [self.items objectAtIndex:indexPath.row]);
    return cell;
}

-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)index {
    return 5.0;
}

-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger) index {
    return 5.0;
}

-(UIEdgeInsets)insetForSectionAtIndex {
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

-(CGSize)sectionHeaderSize {
       return CGSizeMake(self.collectionView.bounds.size.width, 50);
}

-(UICollectionReusableView*)sectionHeaderCellAtIndexPath:(NSIndexPath*) indexPath {
    CollectionViewReusableHeader *reusableview = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionViewReusableHeader cellIdentifier] forIndexPath:indexPath];
    NSString *title = [NSString stringWithFormat:@"Section Title: %@", @(indexPath.section)];
    [reusableview setupWith:title];
    
    return reusableview;
}

-(void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.sectionDelegate) {
        [self.sectionDelegate didSelectSectionItemAtIndex:indexPath.row
                                         inSection:self];
    }
}

@end
