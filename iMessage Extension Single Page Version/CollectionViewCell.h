//
//  CollectionViewCell.h
//  iMessage Extension Single Page Version
//
//  Created by Bat-Erdene, Ene on 5/30/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

@property(strong, nonatomic) IBOutlet UIImageView * verseImage;
@property (strong, nonatomic) NSURL *url;
@end

NS_ASSUME_NONNULL_END
