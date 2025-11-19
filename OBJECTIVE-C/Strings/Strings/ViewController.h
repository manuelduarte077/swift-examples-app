//
//  ViewController.h
//  Strings
//
//  Created by Manuel Duarte on 18/11/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSString *name;
    NSString *lastName;
    int age;
    int salary;
    
    int score;
    int bonus;
    int checkpoint;
    
    float numer1;
    float number2;
    
    BOOL bool1;
    BOOL bool2;
    
}

@property (weak, nonatomic) IBOutlet UILabel *labelFloatDouble;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *labelNumber;
@property (weak, nonatomic) IBOutlet UIButton *botonPrueba;

@end

