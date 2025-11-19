//
//  ViewController.m
//  &OrStatements
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
    
    ////Or Statement
    
    NSString *colour = @"Green";
    
    if ([colour isEqualToString:@"Red"] || [colour isEqualToString:@"Blue"]) {
        
        self.label1.text = @"Nice Colour";
    } else {
        
        self.label1.text = @"Terrible Colour";
        
    }
    
    ////& Statement
    
    NSString *food1 = @"Pizza";
    NSString *food2 = @"Burger";
    
    if ([food1 isEqualToString:@"Pizza"] && [food2 isEqualToString:@"Burger"]) {
        
        self.label2.text = @"Its a match";
    } else {
        
        self.label2.text = @"Don't match";
    }
    
    
    //Login screen
    
    NSString *username = @"Aaron";
    NSString *password = @"Caines";
    
    if ([username isEqualToString:@"Aaron123"] && [password isEqualToString:@"Caines123"]) {
        
        self.label3.text = @"Grant Access";
    
    } else if ([username isEqualToString:@"Aaron123"]) {
        
        self.label3.text = @"Password incorrect";
        
    } else if ([password isEqualToString:@"Caines123"]) {
        
        self.label3.text = @"Username incorrect";
        
    } else {
        
        self.label3.text = @"Username & password incorrect";
        
    }
    
}


@end
