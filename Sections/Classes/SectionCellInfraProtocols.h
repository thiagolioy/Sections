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
@optional
-(instancetype _Nonnull)initWithCollectionView:(UICollectionView* _Nonnull)collectionView;
@optional
-(instancetype _Nonnull)initWithCollectionView:(UICollectionView* _Nonnull)collectionView
                 andCellDelegate:(id<CellDelegate> _Nullable) cellDelegate;

@property (weak, nonatomic, nullable, readonly) UICollectionView *collection;
@property (weak, nonatomic, nullable, readonly) id<CellDelegate> delegate;
@property (strong, nonatomic, nonnull) NSArray *cellBuilders;

@required
-(void)registerCellsForBuilders;
-(NSInteger)numberOfItems;
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath*) indexPath;
-(UICollectionViewCell* _Nonnull)sectionItemCellAtIndexPath:(NSIndexPath* _Nonnull) indexPath;

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
    CobrancaCardSection
};

@protocol CardSectionDelegate;
@protocol SectionDelegate;
@protocol Section <NSObject>

@property(weak, nonatomic, nullable) id<SectionDelegate> sectionDelegate;

-(NSInteger)numberOfItems;
-(CGSize)sectionItemSizeAtIndexPath:(NSIndexPath* _Nonnull) indexPath;
-(UICollectionViewCell* _Nonnull)sectionItemCellAtIndexPath:(NSIndexPath* _Nonnull) indexPath;
-(CGFloat)minimumInteritemSpacingForSectionAtIndex:(NSInteger) index;
-(CGFloat)minimumLineSpacingForSectionAtIndex:(NSInteger) index;
-(CGSize)sectionHeaderSize;
-(UICollectionReusableView* _Nonnull)sectionHeaderCellAtIndexPath:(NSIndexPath* _Nonnull) indexPath;
-(UIEdgeInsets)insetForSectionAtIndex;
-(void)didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
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
@property(weak, nonatomic, nullable) UICollectionView *collection;

-(id<Section> _Nonnull)section;

@end


@protocol GridBuilderProtocol <SectionBuilderProtocol>


@property(weak, nonatomic, nullable) id<SectionDelegate> delegate;
@optional
-(instancetype _Nonnull)initWithCollectionView:(UICollectionView* _Nonnull)collectionView
                  cardSectionDelegate:(id<SectionDelegate> _Nonnull) sectionDelegate;

@end


@protocol CardSectionBuilderProtocol <SectionBuilderProtocol>


@property(weak, nonatomic, nullable) id<CardSectionDelegate> delegate;
@optional
-(instancetype _Nonnull)initWithCollectionView:(UICollectionView* _Nonnull)collectionView
                  cardSectionDelegate:(id<CardSectionDelegate> _Nonnull) cardSectionDelegate;

@end


