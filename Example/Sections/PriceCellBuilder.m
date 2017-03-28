//
//  PriceCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PriceCellBuilder.h"
#import "PriceCell.h"

@implementation PriceCellBuilder
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
    [PriceCell registerForCollectionView:self.collection];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PriceCell *cell = (PriceCell*)[self.collection dequeueReusableCellWithReuseIdentifier:[PriceCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [PriceCell sizeWithin:bounds
                     withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
