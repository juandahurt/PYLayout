//
//  TabExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 1/06/22.
//

import Foundation
import SwiftUI
import MapKit
import Purace

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}

struct TabExample: View {
    let place = IdentifiablePlace(lat: 2.443881, long: -76.605059)
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 2.443881,
                                           longitude: -76.605059),
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
    
    var body: some View {
        PuraceTabView { index in
            Group {
                switch index {
                case 0:
                    VStack {
                        Map(coordinateRegion: $region, annotationItems: [place]) { item in
                            MapMarker(coordinate: place.location, tint: .black)
                        }.frame(height: UIScreen.main.bounds.height * 0.5)
                        Spacer(minLength: 0)
                    }
                default:
                    ScrollView {
                        PuraceVerticalGridView(columns: 2, spacing: 1) {
                            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                                .frame(height: 200)
                            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                                .frame(height: 200)
                            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                                .frame(height: 200)
                            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                                .frame(height: 200)
                        }
                    }
                }
            }.frame(height: UIScreen.main.bounds.height * 0.7)
        }.onAppear {
            MKMapView.appearance().mapType = .mutedStandard
        }
        Spacer()
    }
}
