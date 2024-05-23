//
//  PillView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 23/05/2024.
//

import SwiftUI

struct PillView: View {
    var iconName: String?
    var emoji: String? 
    var text: String = "Playing bla"
    var body: some View {
        HStack(spacing: 2){
            if let iconName{
                Image(systemName: iconName)
                    .renderingMode(.original)
            }else if let emoji{
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(8)
        .background(Color.bumbleLightYellow)
        .cornerRadius(22)
    }
}

#Preview {
    PillView()
}
