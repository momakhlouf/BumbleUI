//
//  CardView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 23/05/2024.
//

import SwiftUI

struct CardView: View {
    var user: User
    var sendComplimentPressed: (()-> Void)? = nil
    var superLikePressed: (()-> Void)? = nil
    var xmarkPressed: (()-> Void)? = nil
    var checkmarkPressed: (()-> Void)? = nil
    var hideAndReportPressed: (()-> Void)? = nil

    @State private var cardFrame: CGRect = .zero
    var body: some View {
        ScrollView(.vertical){
            LazyVStack{
                cardHeaderCell
                    .frame(height: cardFrame.height)
                aboutMeSection
                    .padding(24)
                interestsSection
                    .padding(24)
                
                ForEach(user.images, id: \.self){ image in
                    ImageLoaderView(urlstring: image)
                        .frame(height: cardFrame.height)
                }
                locationView
                    .padding(24)
                
                reactionView
                    .padding(.top, 50)
                    .padding(.horizontal, 24)
                
            }
        }
        .scrollIndicators(.hidden)
        .background(Color.bumbleBackgroundYellow)
        .cornerRadius(35)
        .overlay(
            superLikeButton
                .padding(24)
            ,alignment: .bottomTrailing
        )
        .readingFrame { frame in
            cardFrame = frame
        }
    }
}

#Preview {
    CardView(user: User.mock)
        .padding(12)
}



extension CardView{
    private var cardHeaderCell: some View{
        ZStack(alignment: .bottomLeading){
            ImageLoaderView(urlstring: user.image )
            
            VStack(alignment: .leading, spacing: 8){
                Text(user.firstName + ", \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                HStack(spacing: 4){
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4){
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                HeartView()
                    .onTapGesture {
                        
                    }
            }
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            .background{
                LinearGradient(colors:
                                [Color.bumblBlack.opacity(0), Color.bumblBlack.opacity(0.5),
                                 Color.bumblBlack.opacity(0.7)], startPoint: .top, endPoint: .bottom)
            }
        }
    }
    
    private var aboutMeSection: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("About me")
                .font(.body)
                .foregroundStyle(.bumbleGray)
            
            Text(user.aboutMe)
            
            HStack(spacing: 2){
                HeartView()
                Text("Send a Compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 8)
            .background(Color.bumbleYellow)
            .cornerRadius(32)
            .onTapGesture {
                sendComplimentPressed?()
            }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var interestsSection: some View{
        VStack(alignment: .leading, spacing: 20){
            VStack(alignment: .leading, spacing: 8){
                Text("Basics")
                    .font(.body)
                    .foregroundStyle(.bumbleGray)
                PillGridView(interests: user.basics)
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("Interests")
                    .font(.body)
                    .foregroundStyle(.bumbleGray)
                PillGridView(interests: user.basics)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var locationView: some View{
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text("\(user.firstName)'s Location")
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.bumbleGray)
            
            Text("10 miles away")
            
            PillView(emoji: "🇪🇬" , text: "Lives in Egypt")
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var reactionView: some View{
        VStack(spacing: 20){
            HStack{
                ReactButton(reactImageName: "xmark")
                    .onTapGesture {
                        xmarkPressed?()
                    }
                Spacer()
                ReactButton(reactImageName: "checkmark")
                    .onTapGesture {
                        checkmarkPressed?()
                    }
            }
            .padding()
            
            Text("Hide and Report")
                .foregroundStyle(.bumbleGray)
                .font(.callout)
                .fontWeight(.medium)
                .padding()
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    hideAndReportPressed?()
                }
        }
    }
    
    private var superLikeButton: some View{
        Image(systemName: "hexagon.fill")
            .font(.system(size: 60))
            .foregroundStyle(.bumbleYellow)
            .overlay{
                Image(systemName: "star.fill")
                    .font(.system(size: 30))
            }
            .onTapGesture {
                superLikePressed?()
            }
    }
}
