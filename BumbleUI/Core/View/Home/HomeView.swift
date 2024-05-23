//
//  HomeView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 22/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var SelectedFilter: HomeFilter = .everyone
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12){
                HeaderView()
                FilterView(options: HomeFilter.allCases, selection: $SelectedFilter)
                    
                    .background(
                       
                        Divider(), alignment: .bottom
                    )
                Spacer()
            }
            .padding(8)
        }
    }
}

#Preview {
    HomeView()
}

 
