//
//  PillGridView.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 23/05/2024.
//

import SwiftUI

struct UserInterest{
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct PillGridView: View {
  //  let rows = Array(repeating: GridItem(.fixed(35), spacing: 10), count: 2)
    var interests: [UserInterest] = User.mock.intrests
    var body: some View {
        ZStack{
            
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 10, items: interests) { interests in
                if let interests{
                    PillView(iconName: interests.iconName, emoji: interests.emoji, text: interests.text)
                }
            }
            
//            LazyHGrid(rows: rows, spacing: 5){
//                ForEach(interests, id: \.id) { interest in
//                    PillView(iconName: interest.iconName, emoji: interest.emoji, text: interest.text)
//                        .frame( alignment: .leading)
//                        .background(Color.red)
//                    
//                }
//            }
//            .background(Color.blue)

        }
    }
}

#Preview {
    PillGridView()
    
}

// from swiftfulUI

public struct NonLazyVGrid<T, Content:View>: View {
    var columns: Int = 2
    var alignment: HorizontalAlignment = .center
    var spacing: CGFloat = 8
    let items: [T]
    @ViewBuilder var content: (T?) -> Content
    
    public init(columns: Int = 2, alignment: HorizontalAlignment = .center, spacing: CGFloat = 10, items: [T], @ViewBuilder content: @escaping (T?) -> Content) {
        self.columns = columns
        self.alignment = alignment
        self.spacing = spacing
        self.items = items
        self.content = content
    }

    private var rowCount: Int {
        Int((Double(items.count) / Double(columns)).rounded(.up))
    }
        
    public var body: some View {
        VStack(alignment: alignment, spacing: spacing, content: {
            ForEach(Array(0..<rowCount), id: \.self) { rowIndex in
                HStack(alignment: .top, spacing: spacing, content: {
                    ForEach(Array(0..<columns), id: \.self) { columnIndex in
                        let index = (rowIndex * columns) + columnIndex
                        if index < items.count {
                            content(items[index])
                        } else {
                            content(nil)
                        }
                    }
                })
            }
        })
    }
}
