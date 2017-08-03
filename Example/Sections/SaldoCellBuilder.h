//
//  SaldoCellBuilder.h
//  Experiments
//
//  Created by Thiago Lioy on 27/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CellBuilderProtocol.h"

@interface SaldoCellBuilder : NSObject<CellBuilderProtocol>
-(instancetype _Nonnull)initWithCellDelegate:(id<CellDelegate> _Nonnull) cellDelegate ;
@end
