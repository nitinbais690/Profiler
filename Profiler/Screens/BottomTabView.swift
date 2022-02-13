//
//  BottomTabView.swift
//  Profiler
//
//  Created by mac on 03/02/22.
//

import SwiftUI

struct BottomTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .tag(0)
            
            
            LocationView()
                .tabItem {
                    Label("Location", systemImage: "pin.fill")
                        .font(.title)
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }.tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "ant.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                }.tag(3)
            
        }
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
