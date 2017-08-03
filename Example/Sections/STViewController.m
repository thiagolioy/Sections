//
//  STViewController.m
//  Sections
//
//  Created by thiagolioy on 03/28/2017.
//  Copyright (c) 2017 thiagolioy. All rights reserved.
//

#import "STViewController.h"
#import <Sections/SectionCellInfraProtocols.h>
#import "SaldoCardSectionBuilder.h"
#import "PendenciasCardSectionBuilder.h"
#import "CardsDatasource.h"

@interface STViewController ()<CardSectionDelegate, SectionDelegate>
@property(nonatomic, strong) CardsDatasource *datasource;

@end

@implementation STViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCardsDatasource];
    [self setupTableView];
    
}

-(void)setupCardsDatasource{
    self.datasource = [[CardsDatasource alloc] initWithCollectionView:self.collectionView andDelegate:self andGridCellDelegate:self];
}

-(void)updateCardSection:(id<CardSection>) cardSection {
    NSInteger index = [self.datasource indexOfCardSection:cardSection];
    if(index == NSNotFound)
        return;
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [self.collectionView reloadSections:indexSet];
}

-(void)presentDetailsFor:(id<CardSection>)cardSection {
    NSLog(@"presentDetails for: %@", cardSection);
}

-(void)presentAdditionalDetailsFor:(id<CardSection>)cardSection{
    NSLog(@"presentAdditionalDetails for: %@", cardSection);
}


-(void)didSelectSectionItemAtIndex:(NSInteger)index inSection:(id<Section>)section {
    NSLog(@"Selected Item %@", @(index));
}

-(void)setupTableView {
    self.collectionView.delegate = self.datasource;
    self.collectionView.dataSource = self.datasource;
}



@end
