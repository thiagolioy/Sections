//
//  WhiteSpaceCell.m
//  Experiments
//
//  Created by Thiago Lioy on 23/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "WhiteSpaceCell.h"

@implementation WhiteSpaceCell

+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets)insents {
    CGFloat width = bounds.size.width - (insents.left + insents.right);
    return CGSizeMake(width, 23);
}

+(CGSize)cellSize {
    return CGSizeMake(320, 23);
}


@end
