//
//  NewsDetailView.swift
//  AlamofireAPI
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import SwiftUI


// Displays detailed view of a selected news article.
struct NewsDetailView: View {
    
    let article: Article  // The article passed in to show details
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                //  Display article image if available
                if let url = article.urlToImage, let imageURL = URL(string: url) {
                    AsyncImage(url: imageURL) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray
                    }
                    .cornerRadius(12)
                }
                
                Text(article.title)
                    .font(.title)
                    .bold()
                
                Text(article.content ?? "No content available.")
                
                // ✅ "Read More" link that opens the full article in Safari
                Link("Read More", destination: URL(string: article.url)!)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
    }
}
