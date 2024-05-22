//
//  HeaderView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 22/05/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            HStack(spacing: 0){
            Image(systemName: "line.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    
                }
            
            Image(systemName: "arrow.uturn.left")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
            Text("bumble")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.bumbleYellow)
                .font(.title)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumblBlack)
        .padding(.horizontal, 8)
    }
}

#Preview {
    HeaderView()
}
