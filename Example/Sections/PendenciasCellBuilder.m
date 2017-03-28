//
//  PendenciasCellBuilder.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/27/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PendenciasCellBuilder.h"
#import "PendenciasCell.h"

@implementation PendenciasCellBuilder
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
    [PendenciasCell registerForCollectionView:self.collection];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PendenciasCell *cell = (PendenciasCell*)[self.collection dequeueReusableCellWithReuseIdentifier:[PendenciasCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [PendenciasCell sizeWithin:bounds
                          withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
