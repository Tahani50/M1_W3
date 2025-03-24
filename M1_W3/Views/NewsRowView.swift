//
//  NewsRowView.swift
//  M1_W3.2
//
//  Created by Tahani Ayman on 23/09/1446 AH.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article  // The article to display
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Load and display the article image asynchronously
            AsyncImage(url: article.imageURL) { phase in
                switch phase {
                    
                case .empty:
                    // Placeholder while image is loading
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    // Show the loaded image
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    // Show fallback icon if image fails to load
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                    
                @unknown default:
                    EmptyView() // Fallback for any unexpected cases
                }
            }
            .frame(maxWidth: 350)
            .background(.gray.opacity(0.3))
            .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                
                Text(article.captionText)
                    .font(.caption)
                    .foregroundColor(Color("Color"))
                    .lineLimit(1)
            }
            .padding(.horizontal)
            .padding(.bottom)     
        }
    }
}
