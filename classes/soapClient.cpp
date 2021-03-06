/* soapClient.cpp
   Generated by gSOAP 2.7.15 from ibricolUtils.h
   Copyright(C) 2000-2009, Robert van Engelen, Genivia Inc. All Rights Reserved.
   This part of the software is released under one of the following licenses:
   GPL, the gSOAP public license, or Genivia's license for commercial use.
*/

#if defined(__BORLANDC__)
#pragma option push -w-8060
#pragma option push -w-8004
#endif
#include "soapH.h"

SOAP_SOURCE_STAMP("@(#) soapClient.cpp ver 2.7.15 2013-04-22 10:02:30 GMT")


SOAP_FMAC5 int SOAP_FMAC6 soap_call_ns1__call(struct soap *soap, const char *soap_endpoint, const char *soap_action, char *_activity, char *_localisation, char *_date, char *_partOfTheDay, char *&_callReturn)
{	struct ns1__call soap_tmp_ns1__call;
	struct ns1__callResponse *soap_tmp_ns1__callResponse;
	if (!soap_endpoint)
		soap_endpoint = "http://localhost:8080/Meteoloc/services/Meteoloc";
	if (!soap_action)
		soap_action = "";
	soap->encodingStyle = "http://schemas.xmlsoap.org/soap/encoding/";
	soap_tmp_ns1__call._activity = _activity;
	soap_tmp_ns1__call._localisation = _localisation;
	soap_tmp_ns1__call._date = _date;
	soap_tmp_ns1__call._partOfTheDay = _partOfTheDay;
	soap_begin(soap);
	soap_serializeheader(soap);
	soap_serialize_ns1__call(soap, &soap_tmp_ns1__call);
	if (soap_begin_count(soap))
		return soap->error;
	if (soap->mode & SOAP_IO_LENGTH)
	{	if (soap_envelope_begin_out(soap)
		 || soap_putheader(soap)
		 || soap_body_begin_out(soap)
		 || soap_put_ns1__call(soap, &soap_tmp_ns1__call, "ns1:call", NULL)
		 || soap_body_end_out(soap)
		 || soap_envelope_end_out(soap))
			 return soap->error;
	}
	if (soap_end_count(soap))
		return soap->error;
	if (soap_connect(soap, soap_endpoint, soap_action)
	 || soap_envelope_begin_out(soap)
	 || soap_putheader(soap)
	 || soap_body_begin_out(soap)
	 || soap_put_ns1__call(soap, &soap_tmp_ns1__call, "ns1:call", NULL)
	 || soap_body_end_out(soap)
	 || soap_envelope_end_out(soap)
	 || soap_end_send(soap))
		return soap_closesock(soap);
	_callReturn = NULL;
	if (soap_begin_recv(soap)
	 || soap_envelope_begin_in(soap)
	 || soap_recv_header(soap)
	 || soap_body_begin_in(soap))
		return soap_closesock(soap);
	soap_tmp_ns1__callResponse = soap_get_ns1__callResponse(soap, NULL, "ns1:callResponse", "");
	if (soap->error)
	{	if (soap->error == SOAP_TAG_MISMATCH && soap->level == 2)
			return soap_recv_fault(soap);
		return soap_closesock(soap);
	}
	if (soap_body_end_in(soap)
	 || soap_envelope_end_in(soap)
	 || soap_end_recv(soap))
		return soap_closesock(soap);
	_callReturn = soap_tmp_ns1__callResponse->_callReturn;
	return soap_closesock(soap);
}

#if defined(__BORLANDC__)
#pragma option pop
#pragma option pop
#endif

/* End of soapClient.cpp */
