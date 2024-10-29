//
//  ColeccionMultas.m
//  iMulta
//
//  Created by Christian Manzaraz on 28/10/2024.
//

#import "ColeccionMultas.h"

@implementation ColeccionMultas

-(id) init{
    id parteSuperClase = [super init];
    
    if (self == parteSuperClase) {
        listaMultas = [NSMutableArray array];
    }
    
    return self;
}


-(void) annadirMulta: (Multa *)parMulta {
    [listaMultas addObject:parMulta];
}


-(void) eliminarMulta: (Multa *)parMulta {
    [listaMultas removeObject:parMulta];
}


-(Multa *) getMulta:(int) indice {
    return [listaMultas objectAtIndex:indice];
}


-(int) numeroMultas {
//-(NSUInteger) numeroMultas {
    return [listaMultas count];
}


@end
