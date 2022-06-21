//
//  TopMovie.swift
//  TopMovies
//
//  Created by Consultant on 6/16/22.
//

import Foundation

struct TopMovie:Codable{
    let title: String
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case releaseDate = "release_date"
    }
    
}
struct requestMovie:Codable{
    let page: Int
    let results: [TopMovie]
    
    
}
