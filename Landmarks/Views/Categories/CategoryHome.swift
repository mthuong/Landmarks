//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/15/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    PageView(pages: modelData.features.map {
                        FeatureCard(landmark: $0)
                    })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                    
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
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar(content: {
                Button(action: { showingProfile.toggle() }, label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                })
            })
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environmentObject(modelData)
            })
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
