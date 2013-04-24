//
//  ibricolUtils.mm
//  IBricol
//
//  Created by yohann streibel on 01/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ibricolUtils.h"
#import "MeteolocSoapBinding.nsmap"
#include "soapStub.h"

@implementation ibricolUtils

+ (NSString *) ibricol: (NSString *) activite localisation: (NSString *) localisation jour: (NSString *) jour partOfDay: (NSString *) partOfDay{
	//initialisation de gsoap
	struct soap soap; 
	soap_init(&soap);
	
	//Création des objet Requete/Réponse
	struct ns1__call requete;
	struct ns1__callResponse reponse;
	
	//Passage de l'attribut de la requête :
	requete._activity = (char *) [activite UTF8String];
	requete._localisation = (char *) [localisation UTF8String];
	requete._date = (char *) [jour UTF8String];
	requete._partOfTheDay = (char *) [partOfDay UTF8String];
	
	//Appel du service Web :
	if(!soap_call_ns1__call(&soap, NULL, NULL, requete._activity, requete._localisation, requete._date, requete._partOfTheDay, reponse._callReturn)){
		return [[NSString alloc] initWithCString:reponse._callReturn];
	}
	NSLog(@"Erreur lors de l'appel SOAP");
	return nil;
}

@end
