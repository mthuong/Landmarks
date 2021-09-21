//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by Thuong Nguyen on 9/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
