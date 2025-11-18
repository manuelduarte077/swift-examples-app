//
//  ViewController.m
//  VarialblesConstants
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
    
    word = @"Hello world";
    
    NSString *word2;
    word2 = @"Hello 2";
    word2 = @"Goodbye";
    
    NSString * const word3 = @"Manuel";
    
    int1 = 10;
    
    const int int2 = 20;
    
    
    int1 = 100;
    
    NSLog(@"%d", int2);
    
}


@end
