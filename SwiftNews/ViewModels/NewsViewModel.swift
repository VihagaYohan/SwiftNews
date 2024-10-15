//
//  NewsViewModel.swift
//  SwiftNews
//
//  Created by Yohan on 2024-10-15.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown" 
    }
    
    var description: String {
        return news.description ?? "No description available"
    }
    
    var title: String {
        return news.title ?? "No title available"
    }
    
    var utl: String {
        return news.url ?? "No image available "
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://unsplash.com/photos/man-sitting-on-bench-reading-newspaper-_Zua2hyvTBk"
    }
}
 
