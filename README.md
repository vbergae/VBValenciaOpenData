# VBValenciaOpenData

[![Build Status](https://travis-ci.org/vbergae/VBValenciaOpenData.png?branch=master)](https://travis-ci.org/vbergae/VBValenciaOpenData)
[![Version](http://cocoapod-badges.herokuapp.com/v/VBValenciaOpenData/badge.png)](http://cocoadocs.org/docsets/VBValenciaOpenData)
[![Platform](http://cocoapod-badges.herokuapp.com/p/VBValenciaOpenData/badge.png)](http://cocoadocs.org/docsets/VBValenciaOpenData)

## Installation

VBValenciaOpenData is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "VBValenciaOpenData"

### Configure your 'Authorization.plist' file

*In order to make requests to the offical service, you should provide an username and passowrd. See more info from [here](http://www.valencia.es/ayuntamiento/DatosAbiertos.nsf/vDocumentosTituloAux/Condiciones%20de%20uso?opendocument&lang=1&nivel=5&seccion=1).*

1. Get an scaffolded version from [here](https://github.com/vbergae/VBValenciaOpenData/blob/master/Example/VBValenciaOpenDataExample/Authorization.plist.distribution).
2. Fill with your username/password (request permissions using this [form](http://www.valencia.es/ayuntamiento/DatosAbiertos.nsf/web_fApi?ReadForm&lang=1&nivel=3&seccion=1)).
3. Rename it from Authorization.plist.distribution to Authorization.plist
4. Add Authorization.plist to your app's main bundle.

## Usage

### How to find information near the user.

Based on the documentation provided by Valencia's city hall all services returns
three results. Get more information from this [PDF](http://www.valencia.es/ayuntamiento/DatosAbiertos.nsf/0/2113BD9D1693D7EAC1257C6600449981/$FILE/API%20APPCIUDAD%20v3.pdf?OpenElement&lang=1) (in spanish).

Import main header file:

    #import <VODValenciaOpenData/VODValencia.h>

#### Request information based on user location

##### Parkings

	[VODParking findAllByCoordinates:coordinates   // User location
                  completion:^(NSArray *elements,  // Completion handler
                               NSError *error)) {
    	/** Handle results or error */                           
    }];
    
##### Taxi stops

	[VODTaxi findAllByCoordinates:coordinates   // User location
                       completion:^(NSArray *elements,  // Completion handler
                                    NSError *error)) {
    	/** Handle results or error */                           
    }];
    
##### Valenbisi's parkings and bikes

	[VODValenbisiParking findAllByCoordinates:coordinates   // User location
                                   completion:^(NSArray *elements,  // Completion handler
                                                NSError *error)) {
    	/** Handle results or error */                           
    }];	
    
	[VODValenbisiBike findAllByCoordinates:coordinates   // User location
                                completion:^(NSArray *elements,  // Completion handler
                                             NSError *error)) {
    	/** Handle results or error */                           
    }];	    

##### Wifi points

	[VODWifi findAllByCoordinates:coordinates   // User location
                       completion:^(NSArray *elements,  // Completion handler
                                    NSError *error)) {
    	/** Handle results or error */                           
    }];	

##### Traffic status

	[VODTraffic findAllByCoordinates:coordinates   // User location
                          completion:^(NSArray *elements,  // Completion handler
                                       NSError *error)) {
    	/** Handle results or error */                           
    }];	
    
##### Trash Containers

	[VODContainer findAllByType:VODOilContainer // Container's tyoe
                    coordinates:coordinates 	// User location
                      ompletion:^(NSArray *elements,  // Completion handler
                                  NSError *error)) {
    	/** Handle results or error */                           
    }];	


## License

VBValenciaOpenData is available under the MIT license. See the [LICENSE](https://github.com/vbergae/VBValenciaOpenData/blob/master/LICENSE) file for more info.

