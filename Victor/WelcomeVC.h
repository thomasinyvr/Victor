//
//  WelcomeVC.h
//  Victor
//
//  Created by Rafael on 2016-04-04.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerView.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface WelcomeVC : UIViewController

- (IBAction)startButtonTapped:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *blankVideoView;

@end
