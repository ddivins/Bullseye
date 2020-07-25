//
//  InfoScreenController.h
//  BullsEye
//
//  Created by David S. Divins on 3/16/13.
//  Copyright (c) 2013 David S. Divins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoScreenController : UIViewController

@property (nonatomic, retain) IBOutlet UITextView *quote;

-(IBAction)goToHome:(id)sender;

@end