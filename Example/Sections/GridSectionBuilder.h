//
//  GridSectionBuilder.h
//  Experiments
//
//  Created by Thiago Lioy on 28/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionCellInfraProtocols.h"
@interface GridSectionBuilder : NSObject<GridBuilderProtocol>
@property(nonatomic, strong) NSArray *items;
@end
