//
//  LocationsView.swift
//  BayahibeMap
//
//  Created by Alperen Sarışan on 28.09.2024.
//

import SwiftUI

struct LocationsView: View {
    
    @Environment(LocationsViewModel.self) var locationsViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(locationsViewModel.locations) { loca in
                    Text(loca.id)
                }
            }
        }
        .padding()
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
