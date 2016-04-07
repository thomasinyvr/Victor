//
//  Top10CVC.m
//  Victor
//
//  Created by Rafael on 2016-04-04.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "Top10CVC.h"
#import "CategoriesVC.h"

@interface Top10CVC ()

@property (nonatomic, strong) NSArray *shows;

@property (nonatomic, strong) Show *selectedShow;



@end

@implementation Top10CVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    Show *show1 = [[Show alloc]initWithImage: [UIImage imageNamed:@"Daredevil"]];
    Show *show2 = [[Show alloc]initWithImage: [UIImage imageNamed:@"Game_Of_Thrones"]];
    Show *show3 = [[Show alloc]initWithImage: [UIImage imageNamed:@"The_Flash"]];
    Show *show4 = [[Show alloc]initWithImage: [UIImage imageNamed:@"The_Walking_Dead"]];
    Show *show5 = [[Show alloc]initWithImage: [UIImage imageNamed:@"Arrow3"]];
    Show *show6 = [[Show alloc]initWithImage: [UIImage imageNamed:@"Vikings"]];
    Show *show7 = [[Show alloc]initWithImage: [UIImage imageNamed:@"The_100_1"]];
    Show *show8 = [[Show alloc]initWithImage: [UIImage imageNamed:@"PLL_01"]];
    Show *show9 = [[Show alloc]initWithImage: [UIImage imageNamed:@"Gotham1"]];
    
    
    //    [shows addObject:show1];
    
    
    self.shows = @[show1,show2,show3,show4,show5, show6, show7, show8, show9];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shows.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Top10CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Show *show = self.shows[indexPath.item];
    cell.bannerImageView.image = show.image;
    
    return cell;
    
}

#pragma mark <UICollectionViewDelegate>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    HeaderCRView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderIdentifier" forIndexPath:indexPath];
    header.headerLabel.text = @"Top 10";
    return header;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedShow = self.shows[indexPath.item];
    [self performSegueWithIdentifier:@"showCategories" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CategoriesVC *categoriesVC = segue.destinationViewController;
    
}

        



@end
