//
//  User.swift
//  SpotifyUI
//
//  Created by Mohamed Makhlouf Ahmed on 09/05/2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let firstName, lastName: String
    let email, phone, username, password: String
    let image: String
    let height: Int
    let age: Int
    
    var images: [String] = ["https://picsum.photos/500/500","https://picsum.photos/400/400","https://picsum.photos/700/700"]
    
    var work: String{
        "Worker as Some Job"
    }
    
    var education: String{
        "Graduate Degree"
    }
    
    var aboutMe: String{
        "This is a sentence about me in my profile"
    }
    
    var basics: [UserInterest]{
        [UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
         UserInterest(iconName: "graduationcap", emoji: nil, text: education),
         UserInterest(iconName: "person.fill", emoji: nil, text: "Socially"),
         UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Vigro")]
    }
    
    var intrests: [UserInterest]{
        [UserInterest(iconName: nil, emoji: "👨🏻‍💻", text: "Studying"),
         UserInterest(iconName: nil, emoji: "⚽️", text: "Football"),
         UserInterest(iconName: nil, emoji: "🏓", text: "Tennis"),
         UserInterest(iconName: nil, emoji: "✈️", text: "Travelling")]
    }
    
    static var mock: User{
        User(
            id: 12,
            firstName: "Mohamed",
            lastName: "Makhlouf",
            email: "mo@mo.com",
            phone: "0123456789",
            username: "momakhlouf",
            password: "123123",
            image: Constants.randomImage,
            height: 185,
            age: 27
        )
    }
}
