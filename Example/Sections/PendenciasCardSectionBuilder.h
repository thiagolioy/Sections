//
//  PendenciasCardSectionBuilder.h
//  Experiments
//
//  Created by Mariana Alvarez on 3/27/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionCellInfraProtocols.h"

@interface PendenciasCardSectionBuilder : NSObject<SectionBuilderProtocol>
@property(nonatomic, weak, nullable) id<CardSectionDelegate> delegate;

-(instancetype)initWithSectionDelegate:(id<CardSectionDelegate>) cardSectionDelegate;
@end
