//
//  main.m
//  Command Line API
//
//  Created by Manuel Duarte on 25/3/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // URL del servicio
        NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/todos"];

        // Crear la sesión y la tarea
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error) {
                NSLog(@"Error en la petición: %@", error.localizedDescription);
                return;
            }

            // Verificar el código de estado HTTP
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                // Convertir los datos a un string JSON
                NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"Respuesta del servidor: %@", jsonString);
            } else {
                NSLog(@"Código de estado HTTP: %ld", (long)httpResponse.statusCode);
            }
        }];

        // Ejecutar la tarea
        [task resume];

        // Mantener el programa en ejecución hasta que termine la petición
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
