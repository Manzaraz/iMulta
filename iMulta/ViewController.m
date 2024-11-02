//
//  ViewController.m
//  iMulta
//
//  Created by Christian Manzaraz on 25/10/2024.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void) borrarCampos {
    _automovilMarca.text = @"";
    _automovilModelo.text = @"";
    _automovilMatricula.text = @"";
    
    _personaNombre.text = @"";
    _personaApellidos.text = @"";
    _personaDNI.text = @"";
    
    _multaImporte.text = @"";
    _multaDenuncia.text = @"";
    _multaPuntos.selectedSegmentIndex = 0;
}


-(void) actualizarExplorador: (int)posLista {
    
    if (posLista >= 0) {
        NSLog(@"El índice a mostrar en el explorador es: %i", posLista);
        
        Multa *multa = [coleccionMultas getMulta: posLista];
        
        Vehiculo *vehiculo = [multa vehiculo];
        Persona *persona = [multa persona];
        
        _automovilMarcaLabel.text = [vehiculo marca];
        _automovilModeloLabel.text = [vehiculo modelo];
        _automovilMatriculaLabel.text = [vehiculo matricula];
        
        _personaNombreLabel.text = [persona nombre];
        _personaApellidosLabel.text = [persona apellidos];
        _personaDNILabel.text = [persona dni];
        
        _multaImporteLabel.text = [multa importe];
        _multaPuntosLabel.text = [multa puntos];
        _multaDenunciaLabel.text = [multa denuncia];
        
    } else {
        _automovilMarcaLabel.text = @"";
        _automovilModeloLabel.text = @"";
        _automovilMatriculaLabel.text = @"";
        
        _personaNombreLabel.text = @"";
        _personaApellidosLabel.text = @"";
        _personaDNILabel.text = @"";
        
        _multaImporteLabel.text = @"";
        _multaPuntosLabel.text = @"";
        _multaDenunciaLabel.text = @"";
    }
}


-(IBAction) denunciar:(id)sender {
    Vehiculo *vehiculo = [[Vehiculo alloc] init];
    Persona *persona = [[Persona alloc] init];
    Multa *multa = [[Multa alloc] init];
    
    [vehiculo setMarca: _automovilMarca.text];
    [vehiculo setModelo: _automovilModelo.text];
    [vehiculo setMatricula: _automovilMatricula.text];
    
    [persona setNombre: _personaNombre.text];
    [persona setApellidos: _personaApellidos.text];
    [persona setDni: _personaDNI.text];
    
    [multa setImporte: _multaImporte.text];
    [multa setDenuncia: _multaDenuncia.text];
    [multa setPuntos: [_multaPuntos titleForSegmentAtIndex: [_multaPuntos selectedSegmentIndex]]];
    [multa setVehiculo: vehiculo];
    [multa setPersona: persona];
    
    [coleccionMultas annadirMulta: multa];
    
    
    /** Borrar los Campos */
    [self borrarCampos];
    
    
    /** Actualizar el Explorador */
    _explorador.maximumValue = [coleccionMultas numeroMultas] - 1;
    _explorador.minimumValue = 0;
    _explorador.value = _explorador.maximumValue;
    
    [self actualizarExplorador: _explorador.maximumValue];
}



-(void) actualizarDenuncia: (Multa *)multa {
    Vehiculo *vehiculo = [multa vehiculo];
    Persona *persona = [multa persona];
    
    _automovilMarca.text = [vehiculo marca];
    _automovilModelo.text = [vehiculo modelo];
    _automovilMatricula.text = [vehiculo matricula];
    
    _personaNombre.text = [persona nombre];
    _personaApellidos.text = [persona apellidos];
    _personaDNI.text = [persona dni];
    
    _multaImporte.text = [multa importe];
    
    NSString *puntos = [multa puntos];
    int p = [puntos intValue];
    
    if (p >0) {
        _multaPuntos.selectedSegmentIndex = p / 3;
    } else {
        _multaPuntos.selectedSegmentIndex = 0;
    }
    
    _multaDenuncia.text = [multa denuncia];
}


-(IBAction) modificarDenuncia:(id)sender{
    
    int item = _explorador.value;
    
    if (item >= 0) {
        Multa *multa = [coleccionMultas getMulta:item];
        [coleccionMultas eliminarMulta:multa];
        
        [self actualizarDenuncia: multa];
        
        _explorador.maximumValue = [coleccionMultas numeroMultas] - 1;
        _explorador.value = _explorador.maximumValue;
        
        [self actualizarExplorador:_explorador.maximumValue];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No tienes ninguna denuncia almacenada" message:@"Imposible de Actualizar!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) { }];
        
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


-(IBAction) eliminarDenuncia:(id)sender{
    int item = _explorador.value;
    
    if (item >= 0) {
        Multa *multa = [coleccionMultas getMulta:item];
        [coleccionMultas eliminarMulta:multa];
        
        _explorador.maximumValue = [coleccionMultas numeroMultas] - 1;
        _explorador.value = _explorador.maximumValue;
        
        [self actualizarExplorador: _explorador.maximumValue];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No tienes ninguna denuncia almacenada" message:@"Imposible de Borrar!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


-(IBAction) explorar:(id)sender{
    
    int item = _explorador.value;
    if (item >= 0) {
        [self actualizarExplorador:item];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    coleccionMultas = [[ColeccionMultas alloc] init];
    
    // Do any additional setup after loading the view.
}


@end
