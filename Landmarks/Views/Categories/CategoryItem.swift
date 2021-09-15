//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/15/21.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155, alignment: .center)
                .cornerRadius(10)
                
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var landmarks: [Landmark] = ModelData().landmarks
    static var previews: some View {
        CategoryItem(landmark: landmarks[0])
    }
}
