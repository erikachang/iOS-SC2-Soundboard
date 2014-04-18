//
//  SCSQuotesTableViewController.h
//  Starcraft2Soundboard
//
//  Created by Stephan Chang on 4/16/14.
//  Copyright (c) 2014 AppWerk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SCSQuotesTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AVAudioPlayer *audioPlayer;
    NSArray *_quotes;
}
@property (weak, nonatomic) IBOutlet UITableView *tblQuotes;

@property NSString *unitName;
@end
