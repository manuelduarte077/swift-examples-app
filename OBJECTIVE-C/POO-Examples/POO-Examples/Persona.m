//
//  Persona.m
//  POO-Examples
//
//  Created by Manuel Duarte on 25/3/25.
//

#import "Persona.h"

@implementation Persona

// Método inicializador
- (instancetype)initWithNombre:(NSString *)nombre edad:(NSInteger)edad fechaNacimiento:(NSDate *)fecha {
    self = [super init];
    if (self) {
        _nombre = nombre;
        _edad = edad;
        _fechaNacimiento = fecha;
    }
    return self;
}

// Método para mostrar información de la persona
- (void)mostrarInformacion {
    NSDateFormatter *formato = [[NSDateFormatter alloc] init];
    [formato setDateFormat:@"yyyy-MM-dd"];
    NSString *fechaStr = [formato stringFromDate:self.fechaNacimiento];

    NSLog(@"Nombre: %@, Edad: %ld, Fecha de Nacimiento: %@", self.nombre, (long)self.edad, fechaStr);
}

// Método para convertir la persona en un diccionario (JSON)
- (NSDictionary *)convertirADiccionario {
    NSDateFormatter *formato = [[NSDateFormatter alloc] init];
    [formato setDateFormat:@"yyyy-MM-dd"];
    NSString *fechaStr = [formato stringFromDate:self.fechaNacimiento];

    return @{@"nombre": self.nombre, @"edad": @(self.edad), @"fechaNacimiento": fechaStr};
}

@end
