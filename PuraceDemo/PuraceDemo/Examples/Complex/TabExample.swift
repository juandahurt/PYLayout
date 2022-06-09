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
    
    let urls = [
        URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_santo_domingo_colombia_travel.jpg"),
        URL(string: "https://live.staticflickr.com/3678/9998758505_11f317ab55_b.jpg"),
        URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/71/Casa_en_donde_vivi%C3%B3_y_muri%C3%B3_el_Maestro_Guillermo_Le%C3%B3n_Valencia.jpg"),
        URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Iglesia_San_Francisco_2.JPG"),
        URL(string: "https://c8.alamy.com/zoomses/9/6c76df2a20324b87b4bda7eefe0012f9/dfy7wh.jpg"),
        URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/0f/La_Capilla_de_Belen.jpg"),
        URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_san_agustin_colombia_travel.jpg"),
    ]
    
    func image(url: URL?) -> some View {
        Color.clear
            .background(
                PuraceImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            )
            .clipped()
    }
    
    var body: some View {
        PuraceTabView(titles: ["Acerca de", "Imágenes"]) { index in
            Group {
                switch index {
                case 0:
                    VStack {
                        Map(coordinateRegion: $region, annotationItems: [place]) { item in
                            MapMarker(coordinate: place.location, tint: .black)
                        }
                        Spacer(minLength: 0)
                    }
                default:
                    PuraceHorizontalGridView {
                        ForEach(urls.indices) { index in
                            image(url: urls[index])
                        }
                    }
                }
            }.frame(height: UIScreen.main.bounds.height * 0.4)
        }.onAppear {
            MKMapView.appearance().mapType = .mutedStandard
        }
        Spacer()
    }
}
