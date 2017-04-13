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
@property(weak, nonatomic) UICollectionView *collection;

@optional
@property(weak, nonatomic) id<CellDelegate> delegate;

@optional
-(instancetype)initWithCollectionView:(UICollectionView*)collectionView;
@optional
-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
                 andCellDelegate:(id<CellDelegate>) cellDelegate;

@required
-(void)registerCell;
-(UICollectionViewCell*)cellForItemAtIndexPath:(NSIndexPath*) indexPath;
-(CGSize)sizeWithin:(CGRect)bounds;
@end

