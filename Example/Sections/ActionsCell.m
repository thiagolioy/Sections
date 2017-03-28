//
//  ActionsCell.m
//  Experiments
//
//  Created by Thiago Lioy on 23/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "ActionsCell.h"

@implementation ActionsCell

+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets)insents {
    CGFloat width = bounds.size.width - (insents.left + insents.right);
    return CGSizeMake(width, 50);
}
+(CGSize)cellSize {
    return CGSizeMake(320, 50);
}

- (IBAction)presentDetails:(id)sender {
    if(self.delegate)
        [self.delegate presentDetails];
}

- (IBAction)presentAdditionalDetails:(id)sender {
    if(self.delegate)
        [self.delegate presentAdditionalDetails];
}

@end
