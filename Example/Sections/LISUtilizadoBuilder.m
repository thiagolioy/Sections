//
//  LISUtilizadoBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "LISUtilizadoBuilder.h"
#import "LISUtilizadoCell.h"

@implementation LISUtilizadoBuilder

@synthesize collection, delegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView{
    self = [super init];
    if(self) {
        self.collection = collectionView;
    }
    return self;
}
-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
                      andCellDelegate:(id<CellDelegate>) cellDelegate {
    self = [super init];
    if(self) {
        self.collection = collectionView;
        self.delegate = cellDelegate;
    }
    return self;
}
-(void)registerCell{
    [LISUtilizadoCell registerForCollectionView:self.collection];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LISUtilizadoCell *cell = (LISUtilizadoCell*)[self.collection dequeueReusableCellWithReuseIdentifier:[LISUtilizadoCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [LISUtilizadoCell sizeWithin:bounds
                            withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end

