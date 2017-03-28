//
//  PendenciasCardSectionBuilder.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/27/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PendenciasCardSectionBuilder.h"
#import "PendenciasCardSectionCell.h"
#import "CardSectionImpl.h"

@implementation PendenciasCardSectionBuilder
@synthesize collection, delegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
             cardSectionDelegate:(id<CardSectionDelegate>) cardSectionDelegate{
    self = [super init];
    if(self) {
        self.collection = collectionView;
        self.delegate = cardSectionDelegate;
    }
    return self;
}

-(id<Section>)section {
    
    CardSectionImpl *section = [[CardSectionImpl alloc] initWithCollectionView:self.collection];
    
    PendenciasCardSectionCell *pendenciasCardSection = [[PendenciasCardSectionCell alloc] initWithCollectionView:self.collection andCellDelegate:section];
    
    section.regularSectionCell = pendenciasCardSection;
    
    
    return section;
}

@end
