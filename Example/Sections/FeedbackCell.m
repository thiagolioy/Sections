//
//  FeedbackCell.m
//  Experiments
//
//  Created by Mariana Alvarez on 3/24/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import "FeedbackCell.h"

@implementation FeedbackCell

+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets)insents {
    CGFloat width = bounds.size.width - (insents.left + insents.right);
    return CGSizeMake(width, 56);
}
+(CGSize)cellSize {
    return CGSizeMake(320, 56);
}

@end
