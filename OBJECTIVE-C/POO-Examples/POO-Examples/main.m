//
//  main.m
//  POO-Examples
//
//  Created by Manuel Duarte on 25/3/25.
//

#import <Foundation/Foundation.h>
#import "Persona.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"--- Creando Personas ---");

        // Crear fechas de nacimiento
        NSDateFormatter *formato = [[NSDateFormatter alloc] init];
        [formato setDateFormat:@"yyyy-MM-dd"];
        NSDate *fecha1 = [formato dateFromString:@"1995-08-12"];
        NSDate *fecha2 = [formato dateFromString:@"2001-05-23"];

        // Crear objetos Persona
        Persona *persona1 = [[Persona alloc] initWithNombre:@"Carlos" edad:28 fechaNacimiento:fecha1];
        Persona *persona2 = [[Persona alloc] initWithNombre:@"Ana" edad:22 fechaNacimiento:fecha2];

        // Mostrar información
        [persona1 mostrarInformacion];
        [persona2 mostrarInformacion];

        // Convertir a diccionario (JSON)
        NSDictionary *diccionarioPersona1 = [persona1 convertirADiccionario];
        NSDictionary *diccionarioPersona2 = [persona2 convertirADiccionario];

        NSLog(@"Diccionario Persona 1: %@", diccionarioPersona1);
        NSLog(@"Diccionario Persona 2: %@", diccionarioPersona2);
    }
    return 0;
}
