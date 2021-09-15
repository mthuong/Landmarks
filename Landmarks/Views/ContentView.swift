//
//  ContentView.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(
            selection: $selection,
            content:  {
                CategoryHome().tag(Tab.featured)
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                LandmarkList().tag(Tab.list)
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
