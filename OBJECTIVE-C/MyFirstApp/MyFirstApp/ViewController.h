//
//  ViewController.h
//  MyFirstApp
//
//  Created by Manuel Duarte on 18/11/2025
//  Copyright © 2025 Manuel Duarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController {
    
    SystemSoundID soundID;
    
}

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)cat:(id)sender;





@end

