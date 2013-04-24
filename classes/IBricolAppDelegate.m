//
//  IBricolAppDelegate.m
//  IBricol
//
//  Created by yohann streibel on 29/01/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "IBricolAppDelegate.h"
#import "ibricolUtils.h"
#import "PickerViewController.h"


@implementation IBricolAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (IBAction) actionValider{
	
	if ([date.text isEqualToString:@"Aujourd'hui"]) {
		reponse.text = [ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:@"0" partOfDay:@"d" ];
	}else if ([date.text isEqualToString:@"Ce soir"]) {
		reponse.text = [ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:@"0" partOfDay:@"n" ];
	}else if ([date.text isEqualToString:@"Demain"]) {
		reponse.text = [ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:@"1" partOfDay:@"d" ];
	}else if ([date.text isEqualToString:@"Demain soir"]) {
		reponse.text = [ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:@"1" partOfDay:@"n" ];
	}else if ([date.text isEqualToString:@"Après demain"]) {
		reponse.text = [ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:@"2" partOfDay:@"d" ];
	}else if ([date.text isEqualToString:@"Après demain soir"]) {
		reponse.text = [ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:@"2" partOfDay:@"n" ];
	}
	
	
	if ([reponse.text isEqualToString:@"0"]) {
		reponse.text = @"OUI";
		[feux setImage:[UIImage imageNamed:@"feu-vert.png"]];
	}else if ([reponse.text isEqualToString:@"1"]) {
		reponse.text = @"PEUT-ETRE";
		[feux setImage:[UIImage imageNamed:@"feu-orange.png"]];
	}else if ([reponse.text isEqualToString:@"2"]) {
		reponse.text = @"NON";
		[feux setImage:[UIImage imageNamed:@"feu-rouge.png"]];
	}else if ([reponse.text isEqualToString:@"3"]) {
		reponse.text = @"ERREUR";
		[feux setImage:[UIImage imageNamed:@"feu-neutre.png"]];
		[feux setImage:[UIImage imageNamed:@"feu-neutre.png"]];
		NSString *message =[[NSString alloc] initWithFormat:
							@"Les valeurs de vos champs sont incorrectes! Veuillez les corriger!"];
		UIAlertView *alert=[[UIAlertView alloc] initWithTitle:
							@"IBricol : Valeurs des champs"
													  message:message
													 delegate:nil
											cancelButtonTitle:@"OK"
											otherButtonTitles:nil];
		[alert show];
		[alert release];
		[message release];
	}else {
		reponse.text = @"VALEURS";
		[feux setImage:[UIImage imageNamed:@"feu-neutre.png"]];
		NSString *message =[[NSString alloc] initWithFormat:
							@"Vous devez remplir tous les champs!"];
		UIAlertView *alert=[[UIAlertView alloc] initWithTitle:
							@"IBricol : Valeurs des champs"
													  message:message
													 delegate:nil
											cancelButtonTitle:@"OK"
											otherButtonTitles:nil];
		[alert show];
		[alert release];
		[message release];
	}

	NSLog([ibricolUtils ibricol:@"BRI" localisation:localisation.text jour:date.text partOfDay:@"d" ]);
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (IBAction) actionPickerView{

	pvController = [[PickerViewController alloc] initWithNibName:@"PickerView" bundle:[NSBundle mainBundle]];
	[window addSubview:pvController.view];

}


- (void)dealloc {
	[pvController release];
    [window release];
    [super dealloc];
}


@end
