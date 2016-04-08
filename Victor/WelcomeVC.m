//
//  WelcomeVC.m
//  Victor
//
//  Created by Rafael on 2016-04-04.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "WelcomeVC.h"
#import "Top10CVC.h"
@interface WelcomeVC ()

@end

@implementation WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Get the url to your video
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"victor_intro" withExtension:@"mov"];
    
    // Create a new player view controller with a player object
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *videoController = [[AVPlayerViewController alloc] init];
    videoController.player = player;
    
    // Hide the playback controls
    videoController.showsPlaybackControls = NO;
    
    // Add the video controller as a child view controller
    UIView *videoView = videoController.view;
    [self addChildViewController:videoController];
    [self.blankVideoView addSubview:videoView];
    [videoController didMoveToParentViewController:self];
    
    // Add the video controller's view
//    CGFloat padding = 0;
    videoView.translatesAutoresizingMaskIntoConstraints = NO;
    [videoView.leftAnchor constraintEqualToAnchor:self.blankVideoView.leftAnchor].active = YES;
    [videoView.topAnchor constraintEqualToAnchor:self.blankVideoView.topAnchor].active = YES;
    [videoView.rightAnchor constraintEqualToAnchor:self.blankVideoView.rightAnchor].active = YES;
    [videoView.bottomAnchor constraintEqualToAnchor:self.blankVideoView.bottomAnchor].active = YES;
    
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)startButtonTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"showTop10Screen" sender:self];

    
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

//        Top10CVC *top10CVC = [segue destinationViewController];

}


@end
