//
//  FilterView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 22/05/2024.
//

import SwiftUI

enum HomeFilter: String, CaseIterable {
    case everyone = "Everyone"
    case trending = "Trending"
}

struct FilterView: View {
    var options: [HomeFilter]
    @Binding  var selection: HomeFilter

    @Namespace var namespace
    var body: some View {
        HStack(alignment: .top ,spacing: 32){
            ForEach(options, id: \.self){ option in
                VStack(spacing: 8){
                    Text(option.rawValue)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        
                    if selection == option{
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "namespace", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumblBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
                
            }
        }
        .animation(.smooth, value: selection)
      
    }
}

#Preview {
    FilterView(options: [.everyone, .trending], selection: .constant(.trending))
}
