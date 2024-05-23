//
//  ReactButton.swift
//  BumbleUI
//
//  Created by Mohamed Makhlouf Ahmed on 23/05/2024.
//

import SwiftUI

struct ReactButton: View {
    var reactImageName: String
    var body: some View {
        Circle()
            .fill(.bumbleYellow)
            .frame(width: 60)
            .overlay {
                Image(systemName: reactImageName)
                    .font(.title)
                    .fontWeight(.semibold)
                    
            }
    }
}

#Preview {
    ReactButton(reactImageName: "xmark")
}
