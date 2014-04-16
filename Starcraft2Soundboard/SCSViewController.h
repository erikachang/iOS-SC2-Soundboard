//
//  SCSViewController.h
//  Starcraft2Soundboard
//
//  Created by Stephan Chang on 4/16/14.
//  Copyright (c) 2014 AppWerk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SCSViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
}

@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

@end
