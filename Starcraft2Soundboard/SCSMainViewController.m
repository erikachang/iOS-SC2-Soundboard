//
//  SCSMainViewController.m
//  Starcraft2Soundboard
//
//  Created by Stephan Chang on 4/17/14.
//  Copyright (c) 2014 AppWerk. All rights reserved.
//

#import "SCSMainViewController.h"
#import "SCSUnitsViewController.h"

@interface SCSMainViewController ()

@end

@implementation SCSMainViewController

- (IBAction)raceSelect:(UIButton *)sender {
    [self performSegueWithIdentifier:@"raceSelect" sender:sender];
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
    [self navigationController].navigationBarHidden = YES;
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Children of Aiur.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 0;
	
	if (audioPlayer == nil)
		NSLog(@"%@", [error description]);
	else
		[audioPlayer play];
    
    [audioPlayer setNumberOfLoops:-1];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (audioPlayer)
        [audioPlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSString *segueIdentifier;
    switch (sender.tag) {
        case 0: segueIdentifier = @"Terran";
            break;
        case 1: segueIdentifier = @"Protoss";
            
            break;
        case 2: segueIdentifier = @"Zerg";
        default:
            break;
    }
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.m4a", [[NSBundle mainBundle] resourcePath], segueIdentifier]];
    
    NSError *error;
    soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    SCSUnitsViewController *nextController = (SCSUnitsViewController *)[segue destinationViewController];
    nextController.race = segueIdentifier;
    
    [audioPlayer pause];
    [soundPlayer play];
}


@end
