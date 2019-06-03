//
//  CollectionViewController.h
//  iMessage Extension Single Page Version
//
//  Created by Bat-Erdene, Ene on 5/30/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSMutableArray *verses;
@property (strong, nonatomic) NSString *translation;
@end
NS_ASSUME_NONNULL_END
