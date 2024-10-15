//
//  News.swift
//  SwiftNews
//
//  Created by Yohan on 2024-10-15.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsEnvelop: Decodable {
    let status: String
    let totalResult: Int
    let articles: [News]
}
