//
//  SaldoCell.m
//  Experiments
//
//  Created by Thiago Lioy on 23/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "SaldoCell.h"

@implementation SaldoCell

+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets)insents {
    CGFloat width = bounds.size.width - (insents.left + insents.right);
    return CGSizeMake(width, 80);
}
+(CGSize)cellSize {
    return CGSizeMake(320, 80);
}
- (IBAction)expandCell:(id)sender {
    if(self.delegate)
        [self.delegate tooglePresentationState];
}

@end
