//
//  ActionsCellBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "ActionsCellBuilder.h"
#import "ActionsCell.h"

@implementation ActionsCellBuilder
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
    [ActionsCell registerForCollectionView:self.collection];
}

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ActionsCell *cell = (ActionsCell*)[self.collection dequeueReusableCellWithReuseIdentifier:[ActionsCell cellIdentifier] forIndexPath:indexPath];
    cell.delegate = self.delegate;
    return cell;
}
-(CGSize)sizeWithin:(CGRect)bounds{
    return [ActionsCell sizeWithin:bounds
                       withPadding:UIEdgeInsetsMake(0, 15, 0, 15)];
}
@end
