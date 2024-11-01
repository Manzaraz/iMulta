

//
//  ViewController.h
//  iMulta
//
//  Created by Christian Manzaraz on 25/10/2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property IBOutlet UITextField *automovilMarca;
@property IBOutlet UITextField *automovilModelo;
@property IBOutlet UITextField *automovilMatricula;


@property IBOutlet UITextField *personaNombre;
@property IBOutlet UITextField *personaApellidos;
@property IBOutlet UITextField *personaDNI;


@property IBOutlet UITextField *multaImporte;
@property IBOutlet UITextView *multaDenuncia;
@property IBOutlet UISegmentedControl *multaPuntos;


@property IBOutlet UILabel *automovilMarcaLabel;
@property IBOutlet UILabel *automovilModeloLabel;
@property IBOutlet UILabel *automovilMatriculaLabel;

@property IBOutlet UILabel *personaNombreLabel;
@property IBOutlet UILabel *personaApellidosLabel;
@property IBOutlet UILabel *personaDNILabel;

@property IBOutlet UITextView *multaDenunciaLabel;
@property IBOutlet UILabel *multaImporteLabel;
@property IBOutlet UILabel *multaPuntosLabel;

@property IBOutlet UIStepper *explorador;


-(IBAction) denunciar:(id)sender;

-(IBAction) modificarDenuncia:(id)sender;
-(IBAction) eliminarDenuncia:(id)sender;

-(IBAction) explorar:(id)sender;


@end

