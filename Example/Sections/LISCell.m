//
//  LISCell.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/23/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "LISCell.h"

@implementation LISCell
+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets)insents {
    CGFloat width = bounds.size.width - (insents.left + insents.right);
    return CGSizeMake(width, 90);
}
+(CGSize)cellSize {
    return CGSizeMake(320, 90);
}
@end
