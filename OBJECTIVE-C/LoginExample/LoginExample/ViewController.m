//
//  ViewController.m
//  LoginExample
//
//  Created by Manuel Duarte on 13/6/25.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.returnKeyType = UIReturnKeyDone; // Set return key type to Done
        
    self.statusLabel.text = @"";
}

// Método para ocultar el teclado cuando se toca fuera de los campos de texto
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)loginButtonTapped:(UIButton *)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;

    // Aquí iría tu lógica de autenticación
    if ([username isEqualToString:@"usuario"] && [password isEqualToString:@"contraseña"]) {
        self.statusLabel.textColor = [UIColor greenColor];
        self.statusLabel.text = @"¡Inicio de sesión exitoso!";
        // Aquí podrías navegar a otra vista o realizar alguna acción
        NSLog(@"Inicio de sesión exitoso para: %@", username);
    } else {
        self.statusLabel.textColor = [UIColor redColor];
        self.statusLabel.text = @"Usuario o contraseña incorrectos.";
        NSLog(@"Fallo en el inicio de sesión para: %@", username);
    }
    
    self.passwordTextField.text = @"";
}

@end
