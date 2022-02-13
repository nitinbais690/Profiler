//
//  LocationView.swift
//  Profiler
//
//  Created by mac on 03/02/22.
//

import SwiftUI
import MapKit


struct LocationView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.71792, longitude: 75.8333), span: MKCoordinateSpan(latitudeDelta:  0.2, longitudeDelta:  0.2))
    
    var body: some View {
        GeometryReader { geo in
            Map(coordinateRegion: $region, showsUserLocation: true,  userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
                .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
