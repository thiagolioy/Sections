//
//  SectionCellInfraProtocols.h
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellDelegate;
@protocol SectionCell <NSObject>

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
                 andCellDelegate:(id<CellDelegate>) cellDelegate;

@property (weak, nonatomic) UICollectionView *collection;
@property (weak, nonatomic) id<CellDelegate> delegate;
@property (strong, nonatomic) NSArray *cellBuilders;

-(NSInteger)numberOfItems;
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath;
-(UICollectionViewCell*)sectionItemCellAtIndexPath:(NSIndexPath*) indexPath;

@end


@protocol CellDelegate <NSObject>

@optional
-(void)tooglePresentationState;
-(void)presentDetails;
-(void)presentAdditionalDetails;

@end

typedef NS_ENUM(NSUInteger, CardSectionState) {
    kRegularState,
    kExpandedState
};

@protocol CardSectionDelegate;
@protocol SectionDelegate;
@protocol Section <NSObject>

@property(weak, nonatomic) id<SectionDelegate> sectionDelegate;

-(NSInteger)numberOfItems;
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath;
-(UICollectionViewCell*)sectionItemCellAtIndexPath:(NSIndexPath*) indexPath;
-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger) index;
-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger) index;
-(CGSize)sectionHeaderSize;
-(UICollectionReusableView*)sectionHeaderCellAtIndexPath:(NSIndexPath*) indexPath;
-(UIEdgeInsets)insetForSectionAtIndex;
-(void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end


@protocol CardSection<Section>
@property(nonatomic, assign, readonly) CardSectionState cardState;
@property(nonatomic, strong) id<SectionCell> regularSectionCell;
@property(nonatomic, strong) id<SectionCell> expandedSectionCell;
@property(weak, nonatomic) id<CardSectionDelegate> cardSectionDelegate;

-(void)toggleState;
-(id<SectionCell>)visibleSectionCell;

@end

@protocol CardSectionDelegate<NSObject>
-(void)updateCardSection:(id<CardSection>) cardSection;
-(void)presentDetailsFor:(id<CardSection>) cardSection;
-(void)presentAdditionalDetailsFor:(id<CardSection>) cardSection;
@end




@protocol SectionDelegate<NSObject>
-(void)didSelectSectionItemAtIndex:(NSInteger)index inSection:(id<Section>) section;
@end


@protocol SectionBuilderProtocol <NSObject>

@property(weak, nonatomic) UICollectionView *collection;

-(id<Section>)section;

@end


@protocol GridBuilderProtocol <SectionBuilderProtocol>


@property(weak, nonatomic) id<SectionDelegate> delegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
                  cardSectionDelegate:(id<SectionDelegate>) sectionDelegate;

@end


@protocol CardSectionBuilderProtocol <SectionBuilderProtocol>


@property(weak, nonatomic) id<CardSectionDelegate> delegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
                  cardSectionDelegate:(id<CardSectionDelegate>) cardSectionDelegate;

@end


