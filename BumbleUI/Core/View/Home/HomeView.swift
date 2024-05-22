//
//  HomeView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 22/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack{
                HeaderView()
                    .frame(maxHeight: .infinity,alignment: .top)
            }
        }
    }
}

#Preview {
    HomeView()
}
