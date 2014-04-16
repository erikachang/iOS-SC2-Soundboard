//
//  SCSViewController.m
//  Starcraft2Soundboard
//
//  Created by Stephan Chang on 4/16/14.
//  Copyright (c) 2014 AppWerk. All rights reserved.
//

#import "SCSViewController.h"

@interface SCSViewController ()

@end

@implementation SCSViewController

- (IBAction)btnPlay_onClick:(UIButton *)sender {
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Ready to roast!.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 0;
	
	if (audioPlayer == nil)
		NSLog(@"%@", [error description]);
	else
		[audioPlayer play];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
