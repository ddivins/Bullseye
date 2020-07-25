//
//  SoundScreenController.m
//  BullsEye
//
//  Created by David S. Divins on 2/20/2013.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import "SoundScreenController.h"

@interface SoundScreenController ()

@end

@implementation SoundScreenController
@synthesize mType,mAudioPlayer,mCurrentType;

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
    
    NSString *bgName = nil,*topName=nil;;
    if(SCREEN_HEIGHT==568)
        bgName = @"homebg_iPhone5.png";
    else
        bgName = @"homebg.png";
    isOpeningSoundPlayed = false;
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:50];
    imageView.image = [UIImage imageNamed:bgName];
    
    mTimeLabel.font = [UIFont fontWithName:@"Digital-7" size:50];
    int mins = 0, secs = 0;
    if([mType isEqualToString:@"slow"])
        mins=10,secs=0,topName=@"slow-fire.png",self.navigationBar.topItem.title = @"Slow Fire";
    else if([mType isEqualToString:@"timed"])
        mins=0,secs=20,topName=@"timed-fire.png",self.navigationBar.topItem.title = @"Timed Fire";
    else if([mType isEqualToString:@"rapid"])
        mins=0,secs=10,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"Rapid Fire";
    
    else if([mType isEqualToString:@"drill1"])
        mins=0,secs=1,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"1 Second Drill";
    else if([mType isEqualToString:@"drill2"])
        mins=0,secs=2,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"2 Second Drill";
    else if([mType isEqualToString:@"drill3"])
        mins=0,secs=3,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"3 Second Drill";
    else if([mType isEqualToString:@"drill4"])
        mins=0,secs=4,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"4 Second Drill";
    else if([mType isEqualToString:@"drill5"])
        mins=0,secs=5,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"5 Second Drill";
    else if([mType isEqualToString:@"slow5"])
        mins=5,secs=0,topName=@"rapid-fire.png",self.navigationBar.topItem.title = @"5 Minute Slow Fire";;
   
     mTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",mins,secs];
    
    mTopImgView.image = [UIImage imageNamed:topName];
    
    [self performSelector:@selector(startPlayingMusic) withObject:nil afterDelay:1];

    // Do any additional setup after loading the view from its nib.
}



-(void)startPlayingMusic
{
    
    [self startAudioPlayer:self.mType];
    
    if([self.mType isEqualToString:@"slow"])
        totalTime = 10*60;
    else if([self.mType isEqualToString:@"timed"])
        totalTime = 20;
    else if([self.mType isEqualToString:@"rapid"])
        totalTime = 10;
    else if([self.mType isEqualToString:@"drill1"])
        totalTime = 1;
    else if([self.mType isEqualToString:@"drill2"])
        totalTime = 2;
    else if([self.mType isEqualToString:@"drill3"])
        totalTime = 3;
    else if([self.mType isEqualToString:@"drill4"])
        totalTime = 4;
    else if([self.mType isEqualToString:@"drill5"])
        totalTime = 5;
    else if([self.mType isEqualToString:@"slow5"])
        totalTime = 5*60;
    
}


-(void)startUpdatingLabel
{
    if(isTimerStopped)
        return;
    
    totalTime--;
    
    int secs = 0, mins = 0;
    mins = totalTime/60;
    secs = totalTime-(mins*60);
    
    mTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",mins,secs];
    
    if(totalTime<=0)
    {
        if(audiotimer!=nil)
        {
            [audiotimer invalidate];
            audiotimer = nil;
        }
        
        [self stopAudio];
        [self performSelector:@selector(startAudioPlayer:) withObject:@"close" afterDelay:0];
        
    }
    
    
}


#pragma mark -
#pragma mark BUTTON ACTIONS -------


-(IBAction)replayMusic:(id)sender
{
    if(audiotimer!=nil)
    {
        [audiotimer invalidate];
        audiotimer = nil;
    }
    isOpeningSoundPlayed = false;
    int mins = 0, secs = 0;
    if([self.mType isEqualToString:@"slow"])
        totalTime = 10*60,mins=10,secs=0;
    else if([self.mType isEqualToString:@"timed"])
        totalTime = 20,mins=0,secs=20;
    else if([self.mType isEqualToString:@"rapid"])
        totalTime = 10,mins=0,secs=10;
    else if([self.mType isEqualToString:@"drill1"])
        totalTime = 1,mins=0,secs=1;
    else if([self.mType isEqualToString:@"drill2"])
        totalTime = 2,mins=0,secs=2;
    else if([self.mType isEqualToString:@"drill3"])
        totalTime = 3,mins=0,secs=3;
    else if([self.mType isEqualToString:@"drill4"])
        totalTime = 4,mins=0,secs=4;
    else if([self.mType isEqualToString:@"drill5"])
        totalTime = 5,mins=0,secs=5;
    else if([self.mType isEqualToString:@"slow5"])
        totalTime = 5*60,mins=5,secs=0;
    
    [mPlayPauseButton setImage:[UIImage imageNamed:@"stop.png"] forState:0];
    [mPlayPauseButton setImage:[UIImage imageNamed:@"stop_press.png"] forState:UIControlStateSelected];
    
            
    mTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",mins,secs];
    
    [self startAudioPlayer:self.mType];
    
}

-(IBAction)goToHome:(id)sender
{
    if(audiotimer!=nil)
    {
        [audiotimer invalidate];
        audiotimer = nil;
    }
    
    [self stopAudio];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    
    self.mType = nil;
    self.mCurrentType = nil;
    [super dealloc];
}


-(IBAction)playOrPause:(UIButton *)sender
{
    if([self.mAudioPlayer isPlaying] || isTimerStopped==NO)
    {
        [self.mAudioPlayer pause];
        [sender setImage:[UIImage imageNamed:@"play.png"] forState:0];
        [sender setImage:[UIImage imageNamed:@"play_press.png"] forState:UIControlStateSelected];
        isTimerStopped = YES;
    }
    else
    {
        [self.mAudioPlayer play];
        [sender setImage:[UIImage imageNamed:@"stop.png"] forState:0];
        [sender setImage:[UIImage imageNamed:@"stop_press.png"] forState:UIControlStateSelected];
        isTimerStopped = NO;
        
    }
}


#pragma mark -
#pragma mark AUDIO START ------

-(void)startAudioPlayer:(NSString *)type
{
    NSString *url = nil;
    self.mCurrentType = type;
    
    if([type isEqualToString:@"slow"])
        url = [[NSBundle mainBundle]pathForResource:@"slowFire" ofType:@"mp3"];
    else if([type isEqualToString:@"timed"])
        url = [[NSBundle mainBundle]pathForResource:@"timedFire" ofType:@"mp3"];
    else if([type isEqualToString:@"rapid"])
        url = [[NSBundle mainBundle]pathForResource:@"rapidFire" ofType:@"mp3"];
    else if([type isEqualToString:@"drill1"])
        url = [[NSBundle mainBundle]pathForResource:@"drillString" ofType:@"mp3"];
    else if([type isEqualToString:@"drill2"])
        url = [[NSBundle mainBundle]pathForResource:@"drillString" ofType:@"mp3"];
    else if([type isEqualToString:@"drill3"])
        url = [[NSBundle mainBundle]pathForResource:@"drillString" ofType:@"mp3"];
    else if([type isEqualToString:@"drill4"])
        url = [[NSBundle mainBundle]pathForResource:@"drillString" ofType:@"mp3"];
    else if([type isEqualToString:@"drill5"])
        url = [[NSBundle mainBundle]pathForResource:@"drillString" ofType:@"mp3"];
    else if([type isEqualToString:@"slow5"])
        url = [[NSBundle mainBundle]pathForResource:@"slow5" ofType:@"mp3"];
    else if([type isEqualToString:@"close"])
        url = [[NSBundle mainBundle]pathForResource:@"closingBeep" ofType:@"mp3"];
     else if([type isEqualToString:@"start"])
        url = [[NSBundle mainBundle]pathForResource:@"openingBeep" ofType:@"mp3"];
    
    if(self.mAudioPlayer!=nil)
    {
        self.mAudioPlayer.delegate = nil;
        [self.mAudioPlayer stop];
        self.mAudioPlayer = nil;
    }
    
    NSURL *fileURL = [NSURL fileURLWithPath:url];
    
    self.mAudioPlayer = [[AVAudioPlayer alloc]
                         initWithContentsOfURL:fileURL error:nil];
    [self.mAudioPlayer prepareToPlay];
    self.mAudioPlayer.delegate = self;
    [self.mAudioPlayer play];
    
    if(![type isEqualToString:@"close"])
    {
        //self.mAudioPlayer.numberOfLoops = -1;
    }
    
}

-(void)stopAudio
{
    if(self.mAudioPlayer!=nil)
    {
        [self.mAudioPlayer stop];
        self.mAudioPlayer.delegate = nil;
        self.mAudioPlayer = nil;
    }
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self stopAudio];
    if(!isOpeningSoundPlayed){
        [self performSelector:@selector(startAudioPlayer:) withObject:@"start" afterDelay:0];
        isOpeningSoundPlayed = true;
    }
    if(![self.mCurrentType isEqualToString:@"close"]&&![self.mCurrentType isEqualToString:@"start"])
    {
        audiotimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startUpdatingLabel) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop]addTimer:audiotimer forMode:NSRunLoopCommonModes];
    }
    
    
}

@end
