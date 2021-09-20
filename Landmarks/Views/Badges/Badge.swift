//
//  Badge.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/12/21.
//

import SwiftUI

struct Badge: View {
    @State private var isAnimating = false
    @State private var showProgress = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 6.0)
            .repeatForever(autoreverses: false)
    }
    
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
        }
        .opacity(0.5)
        
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
            .animation(self.isAnimating ? foreverAnimation : .default)
            .onAppear { self.isAnimating = true }
            .onDisappear { self.isAnimating = false }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
