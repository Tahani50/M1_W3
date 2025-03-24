//
//  NewsResponse.swift
//  M1_W3.2
//
//  Created by Tahani Ayman on 23/09/1446 AH.
//


struct NewsResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
