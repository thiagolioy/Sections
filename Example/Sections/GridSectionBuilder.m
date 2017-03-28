//
//  GridSectionBuilder.m
//  Experiments
//
//  Created by Thiago Lioy on 28/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "GridSectionBuilder.h"
#import "GridSectionImpl.h"

@implementation GridSectionBuilder
@synthesize collection, delegate;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView
                  cardSectionDelegate:(id<SectionDelegate>) sectionDelegate {
    self = [super init];
    if(self) {
        self.collection = collectionView;
        self.delegate = sectionDelegate;
    }
    return self;
}



-(id<Section>)section {
    
    GridSectionImpl *section = [[GridSectionImpl alloc] initWithCollectionView:self.collection andSectionDelegate:self.delegate];
    
    section.items = self.items;
    return section;
}

@end
