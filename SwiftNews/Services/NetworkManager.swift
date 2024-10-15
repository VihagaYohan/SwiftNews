//
//  NetworkManager.swift
//  SwiftNews
//
//  Created by Yohan on 2024-10-15.
//

import Foundation

class NetworkManager {
    private let baseURL: String = "https://newsapi.org/v2"
    private let usTopHeadline: String = "top-headlines?country=us"
    
    func getNews(completion: @escaping (([News]?) -> Void)) {
        // construct endpoint URL
        let urlString = baseURL + usTopHeadline + "&apiKey=\(API.key)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsRes = try? JSONDecoder().decode(NewsEnvelop.self, from: data)
            newsRes == nil ? completion(nil) : completion(newsRes!.articles)
        }.resume()
    }
    
    // get image
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }.resume() 
    }
}
