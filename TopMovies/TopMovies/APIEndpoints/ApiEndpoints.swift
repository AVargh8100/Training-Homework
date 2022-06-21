//
//  ApiEndpoints.swift
//  TopMovies
//
//  Created by Consultant on 6/16/22.
//

import Foundation


struct APIEndpoints{
    static let topMovie = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=7500ad90b14332017f5650461885d4b7&page=")
    static let nowPlaying = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=7500ad90b14332017f5650461885d4b7")
    
    
}
