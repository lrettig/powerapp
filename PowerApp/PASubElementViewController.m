//
//  PASubElementViewController.m
//  PowerApp
//
//  Created by Lane Rettig on 10/18/13.
//  Copyright (c) 2013 Lane Rettig. All rights reserved.
//

#import "PASubElementViewController.h"
#import "PAApplicationState.h"

#define kOFFSET_FOR_KEYBOARD 170.0
#define PLACEHOLDER_TEXT "Enter personal notes here"

@interface PASubElementViewController ()

@end

@implementation PASubElementViewController

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
	// Do any additional setup after loading the view.
    self.textviewNotes.delegate = self;
    self.textviewNotes.text = @PLACEHOLDER_TEXT;
    self.textviewNotes.textColor = [UIColor lightGrayColor];
    self.textviewNotes.layer.borderWidth = 1.0f;
    self.textviewNotes.layer.borderColor = [[UIColor blueColor] CGColor];
    
    elementName = [PAApplicationState instance].elements[self.elementPath][0];
    subelementName = [PAApplicationState instance].elements[self.elementPath][2][self.subelementPath][0];
    
    self.title = elementName;
    NSLog(@"Element name: %@", elementName);
    NSLog(@"Subelement name: %@", subelementName);
//    self.labelHeader.text = [NSString stringWithFormat:@"%@ > %@", self.elementName, self.subelementName];
    self.labelHeader.text = subelementName;
}

- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // send data back to parent
    // There is DEFINITELY a cleaner, more proper way to do this, which would
    // probably involve a proper delegate protocol to receive this data.
    // In this case we just pass the goal data object up the stack of VCs
    // and modify it here at the bottom level.
    
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderRatingDidChange:(id)sender {
    NSLog(@"New slider value: %f", ((UISlider *)sender).value);
}


#pragma mark - UITextView delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@PLACEHOLDER_TEXT]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    //move the main view, so that the keyboard does not hide it.
    if  (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @PLACEHOLDER_TEXT;
        textView.textColor = [UIColor lightGrayColor];
    }
    [textView resignFirstResponder];
}

// This is a hack to dismiss keyboard when ENTER (DONE button) is pressed.
// There are more elegant ways of doing this but it works for now.
// http://stackoverflow.com/questions/703754/how-to-dismiss-keyboard-for-uitextview-with-return-key
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

@end
