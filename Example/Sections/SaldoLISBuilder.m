//
//  SaldoLISBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoLISBuilder.h"
#import "SaldoLISCell.h"

@implementation SaldoLISBuilder
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
    [SaldoLISCell registerForCollectionView:self.collection];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SaldoLISCell *cell = (SaldoLISCell*)[self.collection dequeueReusableCellWithReuseIdentifier:[SaldoLISCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [SaldoLISCell sizeWithin:bounds
                        withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
