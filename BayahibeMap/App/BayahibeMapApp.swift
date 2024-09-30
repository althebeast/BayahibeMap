//
//  BayahibeMapApp.swift
//  BayahibeMap
//
//  Created by Alperen Sarışan on 28.09.2024.
//

import SwiftUI

@main
struct BayahibeMapApp: App {
    
    @StateObject private var locationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationsViewModel)
        }
    }
}
