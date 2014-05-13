//
//  BNRQuizControllerViewController.m
//  Quiz
//
//  Created by Ronan Sean Reilly on 02/03/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRQuizControllerViewController.h"

@interface BNRQuizControllerViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizControllerViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call init method implemented by super class
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // create two arrays filled with questions and answers
        self.questions = @[@"From What is Cognac Made?", @"What is 7 + 7?", @"What is the capital of Vermont"];
        
        self.answers = @[@"Grapes", @"14", @"Montpelier"];
    }
    
    // return the address of the new object
    
    return self;
}

-(IBAction)showQuestion:(id)sender{
    // Step to the next question
    self.currentQuestionIndex++;
    
    // am i past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index in that questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in teh questions label
    self.questionLabel.text = question;
    
    // reset the answer label
    self.answerLabel.text = @"???";

}

-(IBAction)showAnswer:(id)sender{
    // what is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // display in teh answr label
    self.answerLabel.text = answer;
}




@end
