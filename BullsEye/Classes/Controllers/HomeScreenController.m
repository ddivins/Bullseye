//
//  HomeScreenController.m
//  BullsEye
//
//  Created by David S. Divins on 2/20/2013.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import "HomeScreenController.h"
#import "InfoScreenController.h"
#import "SoundScreenController.h"
#import "DrillScreenController.h"

@interface HomeScreenController ()

@end

@implementation HomeScreenController

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
    
    NSString *bgName = nil;
    if(SCREEN_HEIGHT==568)
        bgName = @"homebg_iPhone5.png";
    else
        bgName = @"homebg.png";
        
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:50];
    imageView.image = [UIImage imageNamed:bgName];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)slowPressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"slow";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
}

-(IBAction)timedPressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"timed";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)rapidPressed:(id)sender
{
    SoundScreenController *mSoundScreen = [[SoundScreenController alloc]initWithNibName:@"SoundScreenController" bundle:nil];
    mSoundScreen.mType = @"rapid";
    [self.navigationController pushViewController:mSoundScreen animated:YES];
    [mSoundScreen release];
    
}

-(IBAction)infoPressed:(id)sender
{
    InfoScreenController *mInfoScreen = [[InfoScreenController alloc]initWithNibName:@"InfoScreenController" bundle:nil];
    [self.navigationController pushViewController:mInfoScreen animated:YES];
    [mInfoScreen release];
    
}

-(IBAction)drillPressed:(id)sender
{
    DrillScreenController *mDrillScreen = [[DrillScreenController alloc]initWithNibName:@"DrillScreenController" bundle:nil];
    [self.navigationController pushViewController:mDrillScreen animated:YES];
    [mDrillScreen release];
    
}

-(void)dealloc
{
    
    [super dealloc];
}


@end
