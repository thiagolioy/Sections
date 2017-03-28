//
//  PendenciasCell.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/24/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "PendenciasCell.h"

@implementation PendenciasCell

+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets)insents {
    CGFloat width = bounds.size.width - (insents.left + insents.right);
    return CGSizeMake(width, 64);
}

+(CGSize)cellSize {
    return CGSizeMake(320, 64);
}

@end
