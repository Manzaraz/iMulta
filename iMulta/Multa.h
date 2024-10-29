//
//  Multa.h
//  iMulta
//
//  Created by Christian Manzaraz on 28/10/2024.
//

#import <Foundation/Foundation.h>
#import "Vehiculo.h"
#import "Persona.h"

NS_ASSUME_NONNULL_BEGIN

@interface Multa : NSObject

@property Vehiculo *vehiculo;
@property Persona *persona;
@property NSString *importe;
@property NSString *puntos;
@property NSString *denuncia;



@end

NS_ASSUME_NONNULL_END
