//
//  SCSUnitsViewController.m
//  Starcraft2Soundboard
//
//  Created by Stephan Chang on 4/17/14.
//  Copyright (c) 2014 AppWerk. All rights reserved.
//

#import "SCSUnitsViewController.h"
#import "SCSQuotesTableViewController.h"

@interface SCSUnitsViewController ()

@end

@implementation SCSUnitsViewController

- (void)goBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * documentsPath = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"Sounds/%@", self.race]];
    NSError * error;
    NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsPath error:&error];
    _units = directoryContents;
    
    UISwipeGestureRecognizer *swipeRecon = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goBack)];
    [swipeRecon setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self.view addGestureRecognizer:swipeRecon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"unitSelect" sender:indexPath];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_units count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Unit" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [UIImage imageNamed:[_units objectAtIndex:indexPath.row]];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = (NSIndexPath *)sender;
    NSString *path = [NSString stringWithFormat:@"Sounds/%@/%@", self.race, [_units objectAtIndex:indexPath.row]];
    SCSQuotesTableViewController *nextController = (SCSQuotesTableViewController *)[segue destinationViewController];
    nextController.unitName = path;
}


@end
