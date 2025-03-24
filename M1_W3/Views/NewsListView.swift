//
//  NewsListView.swift
//  M1_W3.2
//
//  Created by Tahani Ayman on 23/09/1446 AH.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var newsViewModel = NewsViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var catInput: Category = .general // Currently selected news category

    var body: some View {
        NavigationView {
            VStack {
                List {
                    // Display list of articles using a NavigationLink
                    ForEach(newsViewModel.articles, id: \.id) { article in
                        NavigationLink(destination: NewsDetailView(article: article)) {
                            ArticleRowView(article: article)
                        }
                    }
                    
                    // "Load More" button for pagination
                    if newsViewModel.currentPage <= newsViewModel.totalPages {
                        Button(action: {
                            newsViewModel.fetchNews(from: catInput)
                        }) {
                            Text("Load More")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Color"))
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(catInput.text) // Title reflects current category
            
            //  Fetch news on first appearance
            .onAppear {
                if newsViewModel.articles.isEmpty {
                    newsViewModel.fetchNews(from: catInput)
                }
            }
            
            //  When the user changes category, clear previous articles and fetch new ones
            .onChange(of: catInput) {
                newsViewModel.articles = []         // Clear old articles
                newsViewModel.currentPage = 1       // Reset pagination
                newsViewModel.fetchNews(from: catInput)
            }
            
            // Category picker menu in the navigation bar
            .navigationBarItems(trailing: menu)
        }
    }

    // Menu that lets user pick a news category
    private var menu: some View {
        Menu {
            Picker("Category", selection: $catInput) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0) 
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .imageScale(.large)
                .foregroundColor(Color("Color"))
        }
    }
}
