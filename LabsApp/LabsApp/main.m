//
//  main.m
//  LabsApp
//
//  Created by Manuel Duarte on 19/1/25.
//

#import <Foundation/Foundation.h>

int sumar(int a, int b) {
    return a + b;
}

/// Operaciones Basicas
int operaciones(void){
    int a, b;
        NSLog(@"Ingresa el primer número:");
        scanf("%d", &a);
        NSLog(@"Ingresa el segundo número:");
        scanf("%d", &b);
     
        NSLog(@"Suma: %d", a + b);
        NSLog(@"Resta: %d", a - b);
        NSLog(@"Multiplicación: %d", a * b);
        NSLog(@"División: %.2f", (float)a / b);

    return 0;
}

@interface Persona : NSObject
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, assign) NSInteger edad;

- (void)imprimirDatos;
@end


@implementation Persona

- (void)imprimirDatos {
    NSLog(@"Nombre: %@, Edad: %ld", self.nombre, (long)self.edad);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int result = sumar(10, 3);
        NSLog(@"El resultado es: %d", result);
        
        
        // Par o impar
        int num;
         NSLog(@"Ingresa un número:");
         scanf("%d", &num);
         
         if (num % 2 == 0) {
             NSLog(@"El número %d es par.", num);
         } else {
             NSLog(@"El número %d es impar.", num);
         }
    
        
        // Clase Persona
        Persona *persona = [[Persona alloc] init];
        persona.nombre = @"Lucca";
        persona.edad = 25;
        [persona imprimirDatos];
        
        
        // Manejo de Archivos
        NSString *mensaje = @"Este es un mensaje guardado en un archivo.";
        NSString *ruta = @"/tmp/mensaje.txt";
        
        NSError *error;
        BOOL exito = [mensaje writeToFile:ruta atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if (exito) {
            NSLog(@"Archivo creado exitosamente en: %@", ruta);
        } else {
            NSLog(@"Error al crear archivo: %@", error.localizedDescription);
        }
    }
    
    return 0;
}

