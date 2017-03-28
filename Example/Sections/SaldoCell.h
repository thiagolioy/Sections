//
//  SaldoCell.h
//  Experiments
//
//  Created by Thiago Lioy on 23/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Bricks/Bricks.h>
#import "SectionCellInfraProtocols.h"
#import "Sizeable.h"

@interface SaldoCell : BKBaseCollectionViewCell<Sizeable>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property(weak, nonatomic) id<CellDelegate> delegate;
@end
