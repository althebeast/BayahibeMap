//
//  LocationsView.swift
//  BayahibeMap
//
//  Created by Alperen Sarışan on 28.09.2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    var location: Location?
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $locationsViewModel.showSheetLocation, onDismiss: nil) { showSheet in
            LocationDetailView(location: showSheet)
        }
    }
}

#Preview {
    LocationsView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    
    private var Header: some View {
        VStack {
            Button {
                locationsViewModel.toggleShowLocationList()
            } label: {
                Text(locationsViewModel.mapLocation.name + ", "  + locationsViewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationsViewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: locationsViewModel.showLocationList ? 180 : 0))
                    }
            }
            if locationsViewModel.showLocationList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $locationsViewModel.mapRegion,
            annotationItems: locationsViewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnotationView()
                    .scaleEffect(locationsViewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        locationsViewModel.mapLocation = location
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(locationsViewModel.locations) { location in
                if locationsViewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}
