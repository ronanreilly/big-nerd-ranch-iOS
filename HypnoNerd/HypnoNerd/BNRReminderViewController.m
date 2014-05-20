//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Ronan Sean Reilly on 13/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Get tab bar item.
        UITabBarItem *tbi = self.tabBarItem;
        
        // Give it a label
        tbi.title = @"Reminder";
        
        // Give it an image
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    
    return self;
}

// Overriding this method to see when the veiw is finshed loading, this should be the first view loaded as it is first in the tab bar controller's array. We can see here that this view is lazy loaded.
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view.");
}

// Override thsi method so that the date picker is configured everytime the view is loaded.
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // set minimum date to 60 second from now.
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    // Creating a local notification to be fired on the date selected by user.
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotise";
    note.fireDate = date;
    
    // 
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
