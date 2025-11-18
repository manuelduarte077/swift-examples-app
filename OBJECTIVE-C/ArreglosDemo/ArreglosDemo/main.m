//
//  main.m
//  ArreglosDemo
//
//  Created by Manuel Duarte on 17/11/25.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic) NSInteger edad;
- (instancetype)initWithNombre:(NSString*)nombre edad:(NSInteger)edad;
- (NSString *)description;
@end

@implementation Persona

- (instancetype)initWithNombre:(NSString*)nombre edad:(NSInteger)edad {
    if (self = [super init]) {
        _nombre = [nombre copy];
        _edad = edad;
    }
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%ld)", self.nombre, (long)self.edad];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // ------------------------------------------------------
        // 1. Crear un NSArray (inmutable)
        // ------------------------------------------------------
        // NSArray NO permite modificar elementos (no agregar, no borrar).
        // Usamos @[] para crear un arreglo rápidamente.

        NSArray *frutas = @[@"Manzana", @"Pera", @"Banano", @"Fresa"];
        NSLog(@"Arreglo frutas: %@", frutas);


        // ------------------------------------------------------
        // 2. Acceder a elementos por índice
        // ------------------------------------------------------
        // frutas[0] = "Manzana"
        NSLog(@"Primera fruta: %@", frutas[0]);

        // Siempre es buena práctica validar el índice
        if (frutas.count > 2) {
            NSLog(@"Tercera fruta: %@", frutas[3]);  // Fresa
        }


        // ------------------------------------------------------
        // 3. Recorrer un NSArray (for-in)
        // ------------------------------------------------------
        NSLog(@"\nRecorriendo frutas:");

        for (NSString *f in frutas) {
            // Este for simplifica el recorrido del arreglo
            NSLog(@"- %@", f);
        }


        // ------------------------------------------------------
        // 4. Crear un NSMutableArray (mutable)
        // ------------------------------------------------------
        // Aquí sí podemos agregar, borrar y editar elementos.
        NSMutableArray *colores = [NSMutableArray arrayWithArray:@[@"Rojo", @"Verde"]];
        NSLog(@"\nColores iniciales: %@", colores);


        // ------------------------------------------------------
        // 5. Agregar elementos al arreglo mutable
        // ------------------------------------------------------
        [colores addObject:@"Azul"];
        [colores addObject:@"Amarillo"];
        NSLog(@"Después de agregar: %@", colores);


        // ------------------------------------------------------
        // 6. Insertar en una posición específica
        // ------------------------------------------------------
        [colores insertObject:@"Negro" atIndex:1];
        // Ahora “Negro” está en la posición 1
        NSLog(@"Después de insertar: %@", colores);


        // ------------------------------------------------------
        // 7. Eliminar elementos
        // ------------------------------------------------------
        [colores removeObject:@"Rojo"];  // Busca y elimina "Rojo"
        NSLog(@"Después de eliminar Rojo: %@", colores);


        // ------------------------------------------------------
        // 8. Reemplazar un elemento en un índice específico
        // ------------------------------------------------------
        [colores replaceObjectAtIndex:0 withObject:@"Blanco"];
        NSLog(@"Después de reemplazar: %@", colores);


        // ------------------------------------------------------
        // 9. Buscar dentro de un arreglo
        // ------------------------------------------------------
        BOOL existeAzul = [colores containsObject:@"Azul"];
        NSLog(@"\nTiene 'Azul'? %@", existeAzul ? @"Sí" : @"No");

        NSUInteger indiceNegro = [colores indexOfObject:@"Negro"];
        NSLog(@"Índice de 'Negro': %lu", (unsigned long)indiceNegro);

        NSLog(@"Cantidad de colores: %lu", (unsigned long)colores.count);


        // ------------------------------------------------------
        // 10. Filtrar elementos (NSPredicate)
        // ------------------------------------------------------
        // Crear un arreglo de nombres
        NSArray *nombres = @[@"Ana", @"Luis", @"Carlos", @"Lucia"];

        // Filtrar los que empiezan con L (case insensitive)
        NSPredicate *p = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] %@", @"L"];

        NSArray *filtrados = [nombres filteredArrayUsingPredicate:p];

        NSLog(@"\nNombres que inician con L: %@", filtrados); // Luis, Lucia


        // ------------------------------------------------------
        // 11. Ordenar arreglos
        // ------------------------------------------------------
        NSArray *ordenAsc = [nombres sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        NSLog(@"\nOrden ascendente: %@", ordenAsc);

        NSArray *ordenDesc = [nombres sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            // Compara b con a para invertir el orden
            return [b localizedCaseInsensitiveCompare:a];
        }];
        NSLog(@"Orden descendente: %@", ordenDesc);


        // ------------------------------------------------------
        // 12. Validar índices para evitar errores
        // ------------------------------------------------------
        NSLog(@"\nValidando índices:");

        if (frutas.count > 5) {
            NSLog(@"frutas[5] = %@", frutas[5]);
        } else {
            NSLog(@"No existe el índice 5 en frutas (count=%lu)", (unsigned long)frutas.count);
        }

        // ------------------------------------------------------
        // Fin del programa
        // ------------------------------------------------------
        NSLog(@"\n=== Fin del ejemplo ===");
    }
    return 0;
}
