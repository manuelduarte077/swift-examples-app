//
//  ViewController.h
//  TapMeFast
//
//  Created by Manuel Duarte on 24/11/2025.
//  Copyright © 2025 Manuel Duarte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *timer;
    
    int timeInt;
    int scoreInt;
    int gameMode;
    
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;

@end

