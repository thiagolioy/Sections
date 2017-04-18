//
//  CellBuilderProtocol.h
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionCellInfraProtocols.h"

@protocol CellBuilderProtocol <NSObject>

@required
@property(weak, nonatomic, nullable) UICollectionView *collection;

@optional
@property(weak, nonatomic, nullable) id<CellDelegate> delegate;

@optional
-(instancetype _Nonnull)initWithCollectionView:(UICollectionView* _Nonnull)collectionView;
@optional
-(instancetype _Nonnull)initWithCollectionView:(UICollectionView* _Nonnull)collectionView
                 andCellDelegate:(id<CellDelegate> _Nonnull) cellDelegate;

@required
-(void)registerCell;
-(UICollectionViewCell* _Nonnull)cellForItemAtIndexPath:(NSIndexPath* _Nonnull) indexPath;
-(CGSize)sizeWithin:(CGRect)bounds;
@end

