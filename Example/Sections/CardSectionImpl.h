//
//  CardSectionImpl.h
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionCellInfraProtocols.h"

@interface CardSectionImpl : NSObject<CardSection, CellDelegate>
-(instancetype)init;
@end

