//
//  StaticRowView.swift
//  M1_W3
//
//  Created by Taibah Valley Academy on 3/24/25.
//

import SwiftUI

struct StaticRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var icon: String
    var firstText: String
    var secondText: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color("Color"))
                Image(systemName: icon)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstText)
                .foregroundColor(.gray)
            Spacer()
            Text(secondText)
        }
    }
}
