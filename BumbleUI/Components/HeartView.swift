//
//  HeartView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 23/05/2024.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.bumbleYellow)
                .frame(width: 40, height: 40)
            
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumblBlack)
                .font(.system(size: 22))
                .offset(y: 2)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 10))
        }
    }
}

#Preview {
    HeartView()
}
