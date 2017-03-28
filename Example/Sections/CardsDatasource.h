//
//  CardsDatasource.h
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionCellInfraProtocols.h"

@interface CardsDatasource : NSObject<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong, readonly) NSArray *sectionBuilders;
@property(nonatomic, strong, readonly) NSArray *sectionItems;

-(instancetype)initWithCollectionView:(UICollectionView*)collectionView andDelegate:(id<CardSectionDelegate>) delegate andGridCellDelegate:(id<SectionDelegate>) gridSectionDelegate;
-(NSInteger)indexOfCardSection:(id<CardSection>) cardSection;

    @end
