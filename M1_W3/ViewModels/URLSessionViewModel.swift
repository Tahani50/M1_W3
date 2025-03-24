//
//  URLSessionViewModel.swift
//  M1_W3.2
//
//  Created by Tahani Ayman on 23/09/1446 AH.
//

import Foundation

class URLSessionViewModel: ObservableObject {
    @Published var articles: [Article] = []           // List of fetched articles
    @Published var catName: Category = .general       // Currently selected news category
    @Published var currentPage: Int = 1               // Tracks current page for pagination
    @Published var totalPages: Int = 2
    @Published var isLoading: Bool = false            // Loading state

    // Base URL for the API
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=us"
    private let apiKey = "f1a64c4839e5483995fa05a598fc9114"

    // Fetches news from the API for a specific category using URLSession
    func fetchNews(from category: Category) {
        // Prevent duplicate requests
        guard !isLoading else { return }

        DispatchQueue.main.async {
            self.isLoading = true
            self.catName = category
        }

        // Construct the full URL with category and page
        guard let url = URL(string: "\(baseURL)&page=\(currentPage)&apiKey=\(apiKey)&category=\(category.rawValue)") else {
            print("❌ Invalid URL")
            self.isLoading = false
            return
        }

        print("\n🌍 API REQUEST: Fetch Users")
        print("🔗 URL: \(url)")
        print("🛠 Method: GET\n")

        // Create the URL request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // JSON decoder for handling ISO8601 dates
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        // Perform the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            if let error = error {
                print("❌ Network Error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("❌ Invalid HTTP Response")
                return
            }

            guard let data = data else {
                print("❌ No data received")
                return
            }

            do {
                // Decode the response into NewsResponse
                let newsResponse = try decoder.decode(NewsResponse.self, from: data)

                DispatchQueue.main.async {
                    if let fetchedArticles = newsResponse.articles {
                        self.articles.append(contentsOf: fetchedArticles)
                        self.currentPage += 1
                        print("✅ Articles Loaded: \(fetchedArticles.count)")
                    } else {
                        print("⚠️ No articles found.")
                    }
                }
            } catch {
                print("❌ Decoding Error: \(error.localizedDescription)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("📄 Raw JSON:\n\(jsonString)")
                }
            }
        }.resume()
    }
}
