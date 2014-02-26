# VBValenciaOpenData

[![Build Status](https://travis-ci.org/vbergae/VBValenciaOpenData.png?branch=master)](https://travis-ci.org/vbergae/VBValenciaOpenData)
[![Version](http://cocoapod-badges.herokuapp.com/v/VBValenciaOpenData/badge.png)](http://cocoadocs.org/docsets/VBValenciaOpenData)
[![Platform](http://cocoapod-badges.herokuapp.com/p/VBValenciaOpenData/badge.png)](http://cocoadocs.org/docsets/VBValenciaOpenData)

## Usage

## How to find information near the user.

All methods to request this information lives inside the interface VODAround.h.

Based on the documentation provided by Valencia's city hall all services returns
three results. Get more information from this [PDF](http://www.valencia.es/ayuntamiento/DatosAbiertos.nsf/0/2113BD9D1693D7EAC1257C6600449981/$FILE/API%20APPCIUDAD%20v3.pdf?OpenElement&lang=1) (in spanish).

### Request information about near parkings

    [VODAround findParkings:^(NSArray *elements, NSError *error) {}];

### Request information about near Valenbisi stations

    [VODAround findValenbisiParkings:^(NSArray *elements, NSError *error)) {}];
    [VODAround findValenbisiBikes:^(NSArray *elements, NSError *error)) {}];

### Request information about near Taxi stops

    [VODAround findTaxis:^(NSArray *elements, NSError *error)) {}];

### Request information about near Wifi points

    [VODAround findWifis:^(NSArray *elements, NSError *error)) {}];
    
### Request information about the traffic

    [VODAround findTrafficMessages:^(NSArray *elements, NSError *error)) {}];

## Requirements

## Installation

VBValenciaOpenData is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "VBValenciaOpenData"

## Author

Víctor Berga, vbergae@gmail.com

## License

VBValenciaOpenData is available under the MIT license. See the LICENSE file for more info.

