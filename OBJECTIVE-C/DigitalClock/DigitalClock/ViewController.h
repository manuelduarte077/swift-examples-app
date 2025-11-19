//
//  ViewController.h
//  DigitalClock
//
//  Created by Manuel Duarte on 19/11/2025.
//  Copyright © 2025 Manuel Duarte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *timer;
    
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *settingsView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *clockColourSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundColourSeg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundImageSeg;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

- (IBAction)settings:(id)sender;
- (IBAction)clockColour:(id)sender;
- (IBAction)backgroundColour:(id)sender;
- (IBAction)backgroundImagesSelect:(id)sender;




@end

