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
    
    PendenciasCardSectionCell *pendenciasCardSection = [[PendenciasCardSectionCell alloc] init];
    
    section.regularSectionCell = pendenciasCardSection;
    
    
    return section;
}

@end
