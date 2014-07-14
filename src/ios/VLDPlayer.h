#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface VLDPlayer : CDVPlugin {}

@property (nonatomic,strong) MPMoviePlayerController* player;

- (void)playRegular:(CDVInvokedUrlCommand*)command;

@end
