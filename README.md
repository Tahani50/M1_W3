# 📰 SwiftUI Multi-Screen News App

A beautifully designed SwiftUI-based multi-screen news application that fetches the latest news and category-based headlines from the [NewsAPI.org](https://newsapi.org) using **both URLSession and Alamofire**, with support for **pagination**, **MVVM architecture**, and **responsive UI/UX** based on Apple’s Human Interface Guidelines.

---

## 🚀 Features

### ✅ Home Screen – Latest Headlines
- Displays the latest news headlines using the News API.
- Shows article **title**, **thumbnail image**, and a **short summary**.
- Tap on any article to navigate to the **detail view**.
- "Load More" button to fetch more news (pagination).

### ✅ Category-Based News Screens
- Users can switch between categories such as:
  - Technology
  - Sports
  - Health
- Each category loads its own set of news using filtered API queries.

### ✅ News Detail Screen
- Shows the **full article** with title, image, and full content.
- Includes a **"Read More"** button to open the article in the browser.

### ✅ Architecture & Best Practices
- Clean and maintainable **MVVM architecture**.
- Both **URLSession** and **Alamofire** are implemented.
- Includes proper **error handling** and **loading indicators**.
- Designed using **SwiftUI** and follows Apple’s **Human Interface Guidelines** for seamless UX.

---

## 🛠 Technologies Used

| Feature        | Technology         |
|----------------|--------------------|
| UI Framework   | SwiftUI            |
| API Clients    | URLSession + Alamofire |
| Architecture   | MVVM               |
| State Mgmt     | `@StateObject`, `@Published` |
| Pagination     | ScrollView / List with "Load More" button |

---

## 📦 Setup Instructions

1. **Clone the repo**:
   ```bash
   git clone https://github.com/yourusername/SwiftUI-News-App.git
   cd SwiftUI-News-App

2. **Open in Xcode**:
- Open the .xcodeproj or .xcworkspace in Xcode 15 or later.

3. **Add API Key**:
- Register for a free API key at newsapi.org.
- Replace the placeholder apiKey in NewsViewModel.swift with your own key.
  
4. **Build & Run**:
- Run the project on a simulator or device.
