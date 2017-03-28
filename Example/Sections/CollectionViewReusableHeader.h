//
//  CollectionViewReusableHeader.h
//  Experiments
//
//  Created by Thiago Lioy on 28/03/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sizeable.h"
@interface CollectionViewReusableHeader : UICollectionReusableView<Sizeable>
@property (weak, nonatomic) IBOutlet UILabel *title;
+(NSString*)cellIdentifier;
-(void)setupWith:(NSString*) title;
+(void)registerHeaderCellIn:(UICollectionView *)collectionview;
@end
