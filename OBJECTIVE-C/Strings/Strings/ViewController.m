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
    
    NSString *word = @"Hello";
    
    self.label.text = [NSString stringWithFormat:@"%@ %@", word, name];
    
}


@end
