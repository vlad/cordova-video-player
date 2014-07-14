#import "VLDPlayer.h"
#import <Cordova/CDVViewController.h>

@implementation VLDPlayer

@synthesize player;

- (void)playRegular:(CDVInvokedUrlCommand*)command
{
    NSLog(@"playRegular() called inside VLDPlayer.m");
    
    //setup movie URL
    
    NSString *appDirectory = [[NSBundle mainBundle] resourcePath];

    NSString *path = [command.arguments objectAtIndex:0];
    
    NSURL *movieURL = [NSURL fileURLWithPath:[appDirectory stringByAppendingString:path]];

    NSLog(@"movieURL = %@", [movieURL absoluteString]);
    
    //listen for notifications: exit-fullscreen (including Done button) and movie-finished
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (HideMoviePlayerUponNotification:) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (HideMoviePlayerUponNotification:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    //initialize and run the movie in the player
    self.player = [[MPMoviePlayerController alloc] initWithContentURL: movieURL];
    [self.player prepareToPlay];
    [self.player.view setFrame: self.webView.bounds];
    [self.webView addSubview: self.player.view];
    [player setFullscreen:YES animated:NO];
    [self.player play];
}

- (void)HideMoviePlayerUponNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerDidExitFullscreenNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    [self.player stop];
    [self.player.view removeFromSuperview];
}

@end
