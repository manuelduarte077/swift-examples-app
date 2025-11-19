//
//  ViewController.m
//  DisplayingText
//
//  Created by Manuel Duarte on 19/11/2025.
//  Copyright © 2025 Manuel Duarte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.label.text = @"Hello";
    self.textView.text = @"My name is Manuel";
}

- (IBAction)pressMe:(id)sender {
    
    self.label.text = self.textField.text;
    [self resignFirstResponder];
    
}

- (IBAction)setColour:(id)sender {
    
    self.label.textColor = [UIColor redColor];
    
}

- (IBAction)setBackground:(id)sender {
    
    self.label.backgroundColor = [UIColor yellowColor];
    
}

- (IBAction)fontSize:(id)sender {
    
    [self.label setFont:[UIFont fontWithName:@"Kefa" size:50]];
    
}

- (IBAction)dropShadow:(id)sender {
    
    self.label.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.label.layer.shadowOpacity = 0.25;
    self.label.layer.shadowRadius = 2.0f;
    self.label.layer.shadowOffset = CGSizeMake(2, 2);
    
}

- (IBAction)shadowColour:(id)sender {
    
    self.label.layer.shadowColor = [[UIColor blueColor] CGColor];
    
}

- (IBAction)center:(id)sender {
    
    self.label.textAlignment = NSTextAlignmentCenter;
    
}

- (IBAction)left:(id)sender {
    
    self.label.textAlignment = NSTextAlignmentLeft;
}

- (IBAction)right:(id)sender {
    
    self.label.textAlignment = NSTextAlignmentRight;
}

- (IBAction)customFont:(id)sender {
    
    [self.label setFont:[UIFont fontWithName:@"LemonMilk" size:50]];
    
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound) {
        
        return YES;
    }
    
    [textView resignFirstResponder];
    
    return NO;
    
}


@end
