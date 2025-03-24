//
//  NewsResponse.swift
//  M1_W3.2
//
//  Created by Tahani Ayman on 23/09/1446 AH.
//

import Foundation

fileprivate let relativeDateFormtter = RelativeDateTimeFormatter()

struct Article: Identifiable, Codable {
    var id: UUID { UUID() }
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
    
    
    var descriptionText: String{
        description ?? ""
    }
    
    var captionText: String{
        "\(source.name) ・ \(relativeDateFormtter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else{
            return nil
        }
        return URL(string: urlToImage)
    }
}



