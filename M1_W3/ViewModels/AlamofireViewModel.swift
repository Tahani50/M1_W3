//
//  NewsViewModels.swift
//  M1_W3.2
//
//  Created by Tahani Ayman on 23/09/1446 AH.
//

import Alamofire
import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []           // List of fetched articles
    @Published var catName: Category = .general       // Currently selected news category
    @Published var currentPage: Int = 1               // Tracks current page for pagination
    @Published var totalPages: Int = 2
    @Published var isLoading: Bool = false            // Loading state to prevent multiple simultaneous requests

    // Base URL for the API (country set to US)
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=us"

    // Fetches news from the API for a specific category and current page.
    func fetchNews(from category: Category) {
        // Prevent duplicate requests if already loading
        guard !isLoading else { return }

        // Set loading state and update selected category
        DispatchQueue.main.async {
            self.isLoading = true
            self.catName = category
        }

        // Construct API URL with page number and selected category
        let url = "\(baseURL)&page=\(currentPage)&apiKey=f1a64c4839e5483995fa05a598fc9114&category=\(category.rawValue)"

        print("\n🌍 API REQUEST: Fetch Users")
        print("🔗 URL: \(url)")
        print("🛠 Method: GET\n")

        // JSONDecoder with ISO8601 strategy to decode publication dates
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        // Make the network request using Alamofire
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: NewsResponse.self, decoder: decoder) { response in
                DispatchQueue.main.async {
                    self.isLoading = false // Reset loading state

                    switch response.result {
                    case .success(let data):
                        // Append newly fetched articles to the list
                        if let fetchedArticles = data.articles {
                            self.articles.append(contentsOf: fetchedArticles)
                            self.currentPage += 1 // Increment page for pagination
                            print("✅ Articles Loaded: \(fetchedArticles.count)")
                        } else {
                            print("⚠️ No articles found.")
                        }

                    case .failure(let error):
                        print("❌ API Error: \(error.localizedDescription)")
                        if let data = response.data,
                           let errorJSON = String(data: data, encoding: .utf8) {
                            print("📄 Raw Error Response: \(errorJSON)")
                        }
                    }
                }
            }
    }
}
