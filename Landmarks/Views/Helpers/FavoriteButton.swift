//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/12/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
                isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(.yellow)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FavoriteButton(isSet: .constant(true))
            FavoriteButton(isSet: .constant(false))
        }
    }
}
