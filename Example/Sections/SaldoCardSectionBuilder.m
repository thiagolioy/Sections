//
//  SaldoCardSectionBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoCardSectionBuilder.h"
#import "SaldoExpandedCardSectionCell.h"
#import "SaldoCardSectionCell.h"
#import "CardSectionImpl.h"

@implementation SaldoCardSectionBuilder
@synthesize collection, delegate;

-(instancetype)initWithCollectionView:(UICollectionView*) collectionView
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
    section.cardSectionDelegate = self.delegate;
    
    SaldoCardSectionCell *saldoCardSection = [[SaldoCardSectionCell alloc] initWithCollectionView:self.collection andCellDelegate:section];
    
    
    SaldoExpandedCardSectionCell *saldoExpandedCardSection = [[SaldoExpandedCardSectionCell alloc] initWithCollectionView:self.collection andCellDelegate:section];
    
    
    section.regularSectionCell = saldoCardSection;
    section.expandedSectionCell = saldoExpandedCardSection;
    
    return section;
}


@end
