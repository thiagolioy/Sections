//
//  CardsDatasource.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "CardsDatasource.h"
#import "SaldoCardSectionBuilder.h"
#import "PendenciasCardSectionBuilder.h"
#import "GridSectionBuilder.h"

@interface CardsDatasource ()
@property(nonatomic, strong, readwrite) NSArray *sectionBuilders;
@property(nonatomic, strong, readwrite) NSArray *sectionItems;
@property(nonatomic, strong, nonnull) UICollectionView *collectionView;
@end

@implementation CardsDatasource

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView andDelegate:(id<CardSectionDelegate>) delegate andGridCellDelegate:(id<SectionDelegate>) gridSectionDelegate {
    self = [super init];
    if(self) {
        self.collectionView = collectionView;
        self.sectionBuilders = [self createSectionBuildersForCollectionView: collectionView andDelegate:delegate andGridCellDelegate:gridSectionDelegate];
    }
    return self;
}

-(void)setSectionBuilders:(NSArray *)sectionBuilders {
    _sectionBuilders = sectionBuilders;
    self.sectionItems = [self createCardsSectionItems];
    for (id<Section> section in self.sectionItems) {
        [section registerCellsForBuildersInCollectionView: self.collectionView];
    }
}

-(NSArray*)createSectionBuildersForCollectionView:(UICollectionView*)collectionView
                                 andDelegate:(id<CardSectionDelegate>) delegate andGridCellDelegate:(id<SectionDelegate>) gridSectionDelegate{
    id<SectionBuilderProtocol> saldoSection = [[SaldoCardSectionBuilder alloc] initWithSectionDelegate:delegate];
    
    GridSectionBuilder *gridSection = [[GridSectionBuilder alloc] initWithSectionDelegate:gridSectionDelegate];
    gridSection.items = @[@"1",@"2",@"3",@"4",
                          @"5",@"6",@"7",@"8"];
    
    id<SectionBuilderProtocol> pendenciasSection = [[PendenciasCardSectionBuilder alloc] initWithSectionDelegate:delegate];
    return @[pendenciasSection, gridSection, saldoSection];
}

-(NSArray*)createCardsSectionItems {
    
    NSMutableArray *sections = @[].mutableCopy;
    for(id<SectionBuilderProtocol> builder in self.sectionBuilders) {
        [sections addObject:[builder section]];
    }
    return sections;
}

-(NSInteger)indexOfCardSection:(id<Section>) cardSection {
    NSInteger index = 0;
    for(id<Section> section in self.sectionItems){
        if(section == cardSection) {
            return index;
        }
        index++;
    }
    return NSNotFound;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id<Section> cardSection = self.sectionItems[section];
    return [cardSection numberOfItems];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    id<Section> cardSection = self.sectionItems[indexPath.section];
    return [cardSection sectionItemCellAtIndexPath:indexPath inCollectionView:collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sectionItems.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<Section> cardSection = self.sectionItems[indexPath.section];
    return [cardSection sectionItemSizeAtIndexPath:indexPath inCollectionView:collectionView];
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    id<Section> customSection = self.sectionItems[section];
    return [customSection insetForSectionAtIndex];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    id<Section> customSection = self.sectionItems[section];
    return [customSection minimumInteritemSpacingForSectionAtIndex:section inCollectionView:collectionView];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    id<Section> customSection = self.sectionItems[section];
    return [customSection minimumLineSpacingForSectionAtIndex:section inCollectionView:collectionView];
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    id<Section> customSection = self.sectionItems[section];
    return [customSection sectionHeaderSizeInCollectionView:collectionView];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    id<Section> customSection = self.sectionItems[indexPath.section];
    return [customSection sectionHeaderCellAtIndexPath:indexPath inCollectionView:collectionView];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    id<Section> customSection = self.sectionItems[indexPath.section];
    [customSection didSelectItemAtIndexPath:indexPath inCollectionView:collectionView];
}

@end

