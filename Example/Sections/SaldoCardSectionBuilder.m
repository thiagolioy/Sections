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
@synthesize delegate;

-(instancetype)initWithSectionDelegate:(id<CardSectionDelegate>) cardSectionDelegate {
    self = [super init];
    if(self) {
        self.delegate = cardSectionDelegate;
    }
    return self;
}
-(id<Section>)section {
    
    
    CardSectionImpl *section = [[CardSectionImpl alloc] init];
    section.cardSectionDelegate = self.delegate;
    
    SaldoCardSectionCell *saldoCardSection = [[SaldoCardSectionCell alloc] initWithCellDelegate:section];
    
    
    SaldoExpandedCardSectionCell *saldoExpandedCardSection = [[SaldoExpandedCardSectionCell alloc] initWithCellDelegate:section];
    
    
    section.regularSectionCell = saldoCardSection;
    section.expandedSectionCell = saldoExpandedCardSection;
    
    return section;
}


@end
