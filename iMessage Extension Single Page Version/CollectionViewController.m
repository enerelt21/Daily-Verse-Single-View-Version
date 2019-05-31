//
//  CollectionViewController.m
//  iMessage Extension Single Page Version
//
//  Created by Bat-Erdene, Ene on 5/30/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Daily Verses";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getVerses];
    //self.collectionView = [[UICollectionViewCell  alloc] init];
    self.navigationItem.title = @"Daily Verses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(118, 118);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.collectionView registerClass:CollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.collectionView addSubview:button];
    [button addTarget:self action:@selector(aMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"NVI" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(100.0, 50.0, 200.0, 60.0);

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) getVerses{
    self.verses = [NSMutableArray array];
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    act.center = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);
    [self.view addSubview:act];
    [act startAnimating];
    
    NSDateComponents *todayComp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate: [NSDate date]];
    NSDateComponents *comp = [[NSDateComponents alloc] init] ;
    comp.year = 2019;
    comp.month = 1;
    comp.day = 1;
    
    NSDate *jan1Date = [[NSCalendar currentCalendar] dateFromComponents:comp];
    NSDate *jan2Date = jan1Date;

    NSString *month = NSString.new;
    NSString *day = NSString.new;
    NSString *translation = @"NIV";
    while(comp.month != todayComp.month || comp.day != todayComp.day){
        comp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate: jan2Date];
        //NSLog(@"Year: %ld    Month: %ld    Day: %ld", (long)comp.year, (long)comp.month, (long)comp.day);
        if (comp.month < 10)
            month = [NSString stringWithFormat:@"0%ld", comp.month];
        else
            month = [NSString stringWithFormat:@"%ld", comp.month];
        if (comp.day < 10)
            day = [NSString stringWithFormat:@"0%ld", comp.day];
        else
            day = [NSString stringWithFormat:@"%ld", comp.day];
        NSString *urlString = [NSString stringWithFormat:@"https://votd.olivetree.com/%@_%@_%@.jpg", month, day, translation];

        [self.verses addObject:urlString];
        jan1Date = jan2Date;
        jan2Date = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:1 toDate:jan1Date options:0];
        //NSLog(@"%@", urlString);
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [act stopAnimating];
    });
    
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.verses.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
/*    UIImageView *temp = [[UIImageView alloc] initWithImage:self.verses[indexPath.row]];
    [cell.contentView addSubview:temp];*/
    NSLog(@"%li", (long)indexPath.row);
    NSURL *url = [NSURL URLWithString:self.verses[self.verses.count - indexPath.row - 1]];
    if (cell.url != nil)
        cell.url = url;
    else
    {
        if
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //cell.verseImage = UIImageView.new;
        //UIImage *image = [UIImage imageWithData:data];
        if ([cell.url isEqual:url])
        {
            dispatch_async(dispatch_get_main_queue(), ^{
            cell.verseImage.image = [UIImage imageWithData:data];
            });
        }
        if (error)
        {
            NSLog(@"The process of getting bible verses failed: %@", error);
            return;
        }
    
    }] resume];
    }
    //cell.verseImages.image = self.verses[indexPath.row];
    return cell;
}
-(void) aMethod{
    
}
#pragma mark <UICollectionViewDelegate>
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/
/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/
/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
@end
