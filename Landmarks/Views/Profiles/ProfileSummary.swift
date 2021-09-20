//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Thuong Nguyen on 9/20/21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile;
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Prefer Notification: \(profile.prefersNotifications ? "On" : "Off")")
                
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                
                Text("Goal date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Completed badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    })
                })
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Recent hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                })
            })
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
