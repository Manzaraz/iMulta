//
//  ColeccionMultas.h
//  iMulta
//
//  Created by Christian Manzaraz on 28/10/2024.
//

#import <Foundation/Foundation.h>
#import "Multa.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColeccionMultas : NSObject {
    
    NSMutableArray *listaMultas;
    
}

-(void) annadirMulta: (Multa *)parMulta;
-(void) eliminarMulta: (Multa *)parMulta;
-(Multa *) getMulta:(int) indice;
-(int) numeroMultas;
//-(NSUInteger) numeroMultas;




@end

NS_ASSUME_NONNULL_END
