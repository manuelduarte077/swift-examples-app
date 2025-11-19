//
//  ViewController.m
//  DigitalClock
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
    
    [self updateTimer];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    self.settingsView.hidden = YES;
    self.settingsButton.alpha = 0.15;
    
    self.settingsView.layer.cornerRadius = 5;
    self.settingsButton.layer.cornerRadius = 5;
    
}

-(void)updateTimer {
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    self.label.text = [timeFormat stringFromDate:[NSDate date]];
    
}




- (IBAction)settings:(id)sender {
    
    if (self.settingsView.hidden == YES) {
        
        self.settingsView.hidden = NO;
        self.settingsButton.alpha = 1.0;
        [self.settingsButton setTitle:@"Hide Settings" forState:UIControlStateNormal];
        
    } else {
        
        self.settingsView.hidden = YES;
        self.settingsButton.alpha = 0.15;
        [self.settingsButton setTitle:@"Show Settings" forState:UIControlStateNormal];
        
    }
    
}

- (IBAction)clockColour:(id)sender {
    
    if (self.clockColourSeg.selectedSegmentIndex == 0) {
        
        self.label.textColor = [UIColor whiteColor];
        
    }
    if (self.clockColourSeg.selectedSegmentIndex == 1) {
        
        self.label.textColor = [UIColor blackColor];
        
    }
    if (self.clockColourSeg.selectedSegmentIndex == 2) {
        
        self.label.textColor = [UIColor greenColor];
        
    }
    if (self.clockColourSeg.selectedSegmentIndex == 3) {
        
        self.label.textColor = [UIColor redColor];
        
    }
    
}

- (IBAction)backgroundColour:(id)sender {
    
    self.backgroundImage.hidden = YES;
    
    if (self.backgroundColourSeg.selectedSegmentIndex == 0) {
        
        self.view.backgroundColor = [UIColor blackColor];
        
    }
    if (self.backgroundColourSeg.selectedSegmentIndex == 1) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    if (self.backgroundColourSeg.selectedSegmentIndex == 2) {
        
        self.view.backgroundColor = [UIColor yellowColor];
        
    }
    if (self.backgroundColourSeg.selectedSegmentIndex == 3) {
        
        self.view.backgroundColor = [UIColor blueColor];
        
    }
}

- (IBAction)backgroundImagesSelect:(id)sender {
    
    self.backgroundImage.hidden = NO;
    
    if (self.backgroundImageSeg.selectedSegmentIndex == 0) {
        
        self.backgroundImage.image = [UIImage imageNamed:@"Background1"];
        
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 1) {
        
        self.backgroundImage.image = [UIImage imageNamed:@"Background2"];
        
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 2) {
        
        self.backgroundImage.image = [UIImage imageNamed:@"Background3"];
        
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 3) {
        
        self.backgroundImage.image = [UIImage imageNamed:@"Background4"];
        
    }
}


@end
