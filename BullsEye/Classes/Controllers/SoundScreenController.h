//
//  SoundScreenController.h
//  BullsEye
//
//  Created by David S. Divins on 2/20/2013.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface SoundScreenController : UIViewController<AVAudioPlayerDelegate>
{
    
    NSString *mType;
    int totalTime;
    BOOL isOpeningSoundPlayed;
    
    IBOutlet UILabel *mTimeLabel;
    NSTimer *audiotimer;
    
    IBOutlet UIImageView *mTopImgView;
    IBOutlet UIButton *mPlayPauseButton;
    AVAudioPlayer *mAudioPlayer;
    NSString *mCurrentType;
    BOOL isTimerStopped;
    
}
@property (nonatomic,retain) AVAudioPlayer *mAudioPlayer;

@property (nonatomic,retain) NSString *mType,*mCurrentType;

@property (nonatomic, assign) IBOutlet UINavigationBar *navigationBar;

-(IBAction)playOrPause:(UIButton *)sender;
-(IBAction)replayMusic:(id)sender;
-(IBAction)goToHome:(id)sender;

-(void)startPlayingMusic;
-(void)startUpdatingLabel;

-(void)startAudioPlayer:(NSString *)url;
-(void)stopAudio;

@end
