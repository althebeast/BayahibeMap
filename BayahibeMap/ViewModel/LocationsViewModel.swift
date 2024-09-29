//
//  LocationsViewModel.swift
//  BayahibeMap
//
//  Created by Alperen Sarışan on 28.09.2024.
//

import Foundation

@Observable
class LocationsViewModel {
    
    var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
