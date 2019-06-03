//
//  ViewController.m
//  iMessage Extension Single Page Version
//
//  Created by Bat-Erdene, Ene on 5/29/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Daily Verse";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    NSString *titles = [[NSString alloc] initWithFormat:@"Titles"];
    [self.collectionView registerClass: UICollectionViewCell.class forCellWithReuseIdentifier: titles];
}
-(void) getImage{
    
    
    
    
}


@end
