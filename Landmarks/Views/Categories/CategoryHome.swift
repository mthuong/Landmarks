//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/15/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                    NavigationLink(destination: LandmarkDetail(landmark: modelData.features[0])) {
                        EmptyView()
                    }
                    .frame(width: 0)
                }
                .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
