//
//  ViewController.m
//  Strings
//
//  Created by Manuel Duarte on 18/11/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    name = @"Manuel";
    lastName = @"Duarte";
    
    NSString *word = @"Hola";
    
    self.label.text = [NSString stringWithFormat:@"%@ %@ %@", word, name, lastName];
    
    score = 100;
    bonus = 50;
    checkpoint = 100;
    
    
    int finalScore = score + bonus + checkpoint;
    float total =  23.23;
    
    self.labelNumber.text = [NSString stringWithFormat: @"%d", finalScore];
    
    
    self.labelFloatDouble.text = [NSString stringWithFormat: @"%.4f %d", total, finalScore];
    
    
    NSArray *array = @[@"Apple", @"Banana", @"Fresa", @"Lemon"];
    
    self.label.text = array[0];
    
    
}


@end
