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
-(void)registerCellInCollectionView:(UICollectionView* _Nonnull)collectionView;
-(UICollectionViewCell * _Nonnull)cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath inCollectionView:(UICollectionView* _Nonnull)collectionView;
-(CGSize)sizeWithin:(CGRect)bounds;
@end

