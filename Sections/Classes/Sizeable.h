//
//  Sizeable.h
//  Experiments
//
//  Created by Thiago Lioy on 28/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Sizeable <NSObject>
+(CGSize)sizeWithin:(CGRect)bounds withPadding:(UIEdgeInsets) insents;
@end
