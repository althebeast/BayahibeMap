//
//  LocationsListView.swift
//  BayahibeMap
//
//  Created by Alperen Sarışan on 29.09.2024.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(locationsViewModel.locations) { location in
                Button {
                    locationsViewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
            HStack {
                if let imageName = location.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                        Text(location.cityName)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
    }
    
}
