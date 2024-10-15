//
//  NewsListVM.swift
//  SwiftNews
//
//  Created by Yohan on 2024-10-15.
//

import Foundation

class NewsListVM: ObservableObject {
    @Published var news: [NewsViewModel] = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    
    func load() {
       getNews()
    }
    
    private func getNews() {
        let networkManager = NetworkManager()
        networkManager.getNews { newsArticles in
            guard let news = newsArticles else { return }
             
            let newsVM = news.map(NewsViewModel.init)
            self.getImages(for: newsVM )
            DispatchQueue.main.async {
                self.news = newsVM
            }
        }
    }
    
    private func getImages(for news: [NewsViewModel]) {
        let networkManager = NetworkManager()
        
        news.forEach { newsItem in
            guard !newsItem.urlToImage.isEmpty else { return }
            
            networkManager.getImage(urlString: newsItem.urlToImage) { (data) in
                guard let data = data else {return}
                
                DispatchQueue.main.async {
                    self.imageData[newsItem.urlToImage] = data
                }
            }
        }
    }
}
