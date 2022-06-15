//
//  rmAPIProtocol.swift
//  RickAndMorty
//
//  Created by Consultant on 6/14/22.
//

import Foundation
protocol rmAPIProtocol{
    associatedtype R
    var baseUrl: String{
        get set
    }
    func fetchData() -> R
}
