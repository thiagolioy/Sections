//
//  CardSectionImpl.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "CardSectionImpl.h"
#import "CollectionViewReusableHeader.h"


@implementation CardSectionImpl
@synthesize cardState, regularSectionCell, expandedSectionCell, cardSectionDelegate, sectionDelegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collection{
    self = [super init];
    if(self) {
        cardState = kRegularState;
        self.collectionView = collection;
        [self registerHeaderSectionViewsIn: collection];
    }
    return self;
}

-(void)toggleState {
    if(!self.expandedSectionCell) {
        return;
    }
    
    if(cardState == kRegularState) {
        cardState = kExpandedState;
    } else {
        cardState = kRegularState;
    }
}
-(id<SectionCell>)visibleSectionCell {
    if(!self.expandedSectionCell) {
        return self.regularSectionCell;
    }
    
    if(cardState == kRegularState) {
        return self.regularSectionCell;
    }else {
        return self.expandedSectionCell;
    }
}

-(void)registerHeaderSectionViewsIn:(UICollectionView*) collection {
    [CollectionViewReusableHeader registerHeaderCellIn:collection];
}


-(NSInteger)numberOfItems {
    return [[self visibleSectionCell] numberOfItems];
}
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath {
    return [[self visibleSectionCell] sectionItemSizeAtIndexPath:indexPath];
}
-(UICollectionViewCell*)sectionItemCellAtIndexPath:(NSIndexPath*) indexPath {
    return [[self visibleSectionCell] sectionItemCellAtIndexPath:indexPath];
}

-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger)index{
    return 0;
}

-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger) index {
    return 0;
}

-(UIEdgeInsets)insetForSectionAtIndex {
    return UIEdgeInsetsMake(0, 0, 0, 0);
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



-(void)tooglePresentationState {
    [self toggleState];
    if(self.cardSectionDelegate)
        [self.cardSectionDelegate updateCardSection:self];
}

-(void)presentDetails {
    if(self.cardSectionDelegate)
        [self.cardSectionDelegate presentDetailsFor:self];
}

-(void)presentAdditionalDetails {
    if(self.cardSectionDelegate)
        [self.cardSectionDelegate presentAdditionalDetailsFor:self];
}

-(void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}


@end

