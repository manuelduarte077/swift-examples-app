//
//  Persona.h
//  POO-Examples
//
//  Created by Manuel Duarte on 25/3/25.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject

// Propiedades
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, assign) NSInteger edad;
@property (nonatomic, strong) NSDate *fechaNacimiento;

// Métodos
- (instancetype)initWithNombre:(NSString *)nombre edad:(NSInteger)edad fechaNacimiento:(NSDate *)fecha;
- (void)mostrarInformacion;
- (NSDictionary *)convertirADiccionario;

@end
