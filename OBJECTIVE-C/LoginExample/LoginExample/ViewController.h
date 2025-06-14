//
//  ViewController.h
//  LoginExample
//
//  Created by Manuel Duarte on 13/6/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

    @property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
    @property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
    @property (weak, nonatomic) IBOutlet UILabel *statusLabel;

    - (IBAction)loginButtonTapped:(UIButton *)sender;

@end

