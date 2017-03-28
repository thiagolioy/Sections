//
//  WhiteSpaceCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "WhiteSpaceCellBuilder.h"
#import "WhiteSpaceCell.h"

@implementation WhiteSpaceCellBuilder
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
    [WhiteSpaceCell registerForCollectionView:self.collection];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WhiteSpaceCell *cell = (WhiteSpaceCell*)[self.collection dequeueReusableCellWithReuseIdentifier:[WhiteSpaceCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [WhiteSpaceCell sizeWithin:bounds
                          withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end

