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
@property (strong, nonatomic, nonnull) NSArray *cellBuilders;

@required
-(void)registerCellsForBuildersInCollectionView:(UICollectionView* _Nonnull)collectionView;
-(NSInteger)numberOfItems;
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath inCollectionView:(UICollectionView* _Nonnull)collectionView;
-(UICollectionViewCell* _Nonnull)sectionItemCellAtIndexPath:(NSIndexPath* _Nonnull) indexPath inCollectionView:(UICollectionView* _Nonnull)collectionView;

@end

typedef NS_ENUM(NSUInteger, CardSectionState) {
    kRegularState,
    kExpandedState
};

@protocol CellDelegate <NSObject>

@optional
-(void)tooglePresentationState;
-(void)presentDetails;
-(void)presentAdditionalDetails;

@end

typedef NS_ENUM (NSInteger, SectionType) {
    SaldoCardSection,
    PendenciasCardSection,
    FeedbackCardSection,
    CobrancaCardSection,
    BannerCardSection
};

@protocol CardSectionDelegate;
@protocol SectionDelegate;
@protocol Section <NSObject>

@property(weak, nonatomic, nullable) id<SectionDelegate> sectionDelegate;
-(void)registerCellsForBuildersInCollectionView:(UICollectionView* _Nonnull)collectionView;
-(NSInteger)numberOfItems;
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath* _Nonnull) indexPath inCollectionView:(UICollectionView*)collectionView;
-(UICollectionViewCell* _Nonnull)sectionItemCellAtIndexPath:(NSIndexPath* _Nonnull) indexPath inCollectionView:(UICollectionView*)collectionView;
-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger) index inCollectionView:(UICollectionView*)collectionView;
-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger) index inCollectionView:(UICollectionView*)collectionView;
-(CGSize)sectionHeaderSizeInCollectionView:(UICollectionView*) collectionView;
-(UICollectionReusableView* _Nonnull)sectionHeaderCellAtIndexPath:(NSIndexPath* _Nonnull) indexPath inCollectionView:(UICollectionView*)collectionView;
-(UIEdgeInsets)insetForSectionAtIndex;
-(void)didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath inCollectionView:(UICollectionView*)collectionView;
@end


@protocol CardSection<Section>
@property(nonatomic, assign, readonly) CardSectionState cardState;
@property(nonatomic, strong, nonnull) id<SectionCell> regularSectionCell;
@property(nonatomic, strong, nullable) id<SectionCell> expandedSectionCell;
@property(weak, nonatomic, nullable) id<CardSectionDelegate> cardSectionDelegate;

-(void)toggleState;
-(id<SectionCell> _Nonnull)visibleSectionCell;

@end

@protocol CardSectionDelegate<NSObject>
-(void)updateCardSection:(id<CardSection> _Nonnull) cardSection;
-(void)presentDetailsFor:(id<CardSection> _Nonnull) cardSection;
-(void)presentAdditionalDetailsFor:(id<CardSection> _Nonnull) cardSection;
@end




@protocol SectionDelegate<NSObject>
-(void)didSelectSectionItemAtIndex:(NSInteger)index inSection:(id<Section> _Nonnull) section;
@end


@protocol SectionBuilderProtocol <NSObject>
@property(nonatomic, assign) SectionType type;

-(id<Section> _Nonnull)section;

@end
