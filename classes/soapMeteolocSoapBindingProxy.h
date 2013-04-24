/* soapMeteolocSoapBindingProxy.h
   Generated by gSOAP 2.7.15 from ibricolUtils.h
   Copyright(C) 2000-2009, Robert van Engelen, Genivia Inc. All Rights Reserved.
   This part of the software is released under one of the following licenses:
   GPL, the gSOAP public license, or Genivia's license for commercial use.
*/

#ifndef soapMeteolocSoapBindingProxy_H
#define soapMeteolocSoapBindingProxy_H
#include "soapH.h"
class MeteolocSoapBinding
{   public:
	/// Runtime engine context allocated in constructor
	struct soap *soap;
	/// Endpoint URL of service 'MeteolocSoapBinding' (change as needed)
	const char *endpoint;
	/// Constructor allocates soap engine context, sets default endpoint URL, and sets namespace mapping table
	MeteolocSoapBinding()
	{ soap = soap_new(); endpoint = "http://localhost:8080/Meteoloc/services/Meteoloc"; if (soap && !soap->namespaces) { static const struct Namespace namespaces[] = 
{
	{"SOAP-ENV", "http://schemas.xmlsoap.org/soap/envelope/", "http://www.w3.org/*/soap-envelope", NULL},
	{"SOAP-ENC", "http://schemas.xmlsoap.org/soap/encoding/", "http://www.w3.org/*/soap-encoding", NULL},
	{"xsi", "http://www.w3.org/2001/XMLSchema-instance", "http://www.w3.org/*/XMLSchema-instance", NULL},
	{"xsd", "http://www.w3.org/2001/XMLSchema", "http://www.w3.org/*/XMLSchema", NULL},
	{"ns1", "http://services.meteoloc.com", NULL, NULL},
	{NULL, NULL, NULL, NULL}
};
	soap->namespaces = namespaces; } };
	/// Destructor frees deserialized data and soap engine context
	virtual ~MeteolocSoapBinding() { if (soap) { soap_destroy(soap); soap_end(soap); soap_free(soap); } };
	/// Invoke 'call' of service 'MeteolocSoapBinding' and return error code (or SOAP_OK)
	virtual int ns1__call(char *_activity, char *_localisation, char *_date, char *_partOfTheDay, char *&_callReturn) { return soap ? soap_call_ns1__call(soap, endpoint, NULL, _activity, _localisation, _date, _partOfTheDay, _callReturn) : SOAP_EOM; };
};
#endif
