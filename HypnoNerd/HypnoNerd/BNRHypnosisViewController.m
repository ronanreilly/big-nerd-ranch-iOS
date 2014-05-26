//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Ronan Sean Reilly on 10/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisView () <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Tab bar items title
        self.tabBarItem.title = @"Hypnosis";
        
        // UI image for Tab
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Place image on tab bar
        self.tabBarItem.image = i;
        
        // Create a segmented control with 3 items
        UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:(NSArray *)@[@"Red", @"Green", @"Blue"]];
        // Make and position a rect
        sc.frame = CGRectMake(35, 200, 250, 50);
        // Default selection
        sc.selectedSegmentIndex = 0;
        // set background color
        sc.backgroundColor = [UIColor lightGrayColor];
        // set target, selector
        [sc addTarget:self
               action:@selector(changeColor:)
     forControlEvents:UIControlEventValueChanged];
     [self.view addSubview:sc];
    }
    
    return self;

}

// This method handles the UISegmented controls touch events
-(void)changeColor:(id)sender{
    // reference to UISegmentedContol
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"The Segment control was touched %ld", (long)segmentedControl.selectedSegmentIndex);
    // Checking each of our segments for a touch and changing color of concentric circle colors
    if (segmentedControl.selectedSegmentIndex == 0) {
        ((BNRHypnosisView *)self.view).circleColor = [UIColor redColor];
    }
    if (segmentedControl.selectedSegmentIndex == 1) {
        ((BNRHypnosisView *)self.view).circleColor = [UIColor greenColor];
    }
    if (segmentedControl.selectedSegmentIndex == 2) {
        ((BNRHypnosisView *)self.view).circleColor = [UIColor blueColor];
    }
}

// Overriding this method to see when the veiw is finshed loading, this should be the first view loaded as it is first in the tab bar controller's array.
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@", textField);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

-(void)drawHypnoticMessage:(NSString *)message{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // configure labels
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // resize label relative to text being displayed
        [messageLabel sizeToFit];
        
        // Get a random value that fits within the hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        
        int x = arc4random() % width;
        
        // get random y value that fits within the hypnosis views height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x,y);
        messageLabel.frame = frame;
        
        // add the label to the heirarchy
        [self.view addSubview:messageLabel];
        
    }
}

// Overriding loadView
-(void)loadView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Set the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [backgroundView addSubview:textField];
    
    textField.placeholder = @"Hypnotise Me!";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    self.view = backgroundView;
}

@end
