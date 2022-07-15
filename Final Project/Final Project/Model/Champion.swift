//
//  Champion.swift
//  Final Project
//
//  Created by Consultant on 7/6/22.
//

import Foundation

//struct Champion{
//    let descriptions: [String]
//    let name: [String]
//}


struct ApiRequest: Codable{

    let categories: [Promotion]


}

struct Promotion:Codable{
    let id:String
    let weightClass: [WeightClass]?

    enum CodingKeys: String, CodingKey{
        case id = "id"
        case weightClass = "weight_classes"
        //case competitor = "competitor"
     }

}

struct WeightClass:Codable{
    let descriptions: String
//    let competitors: [Competitor]
    let competitor: Competitor

   enum CodingKeys: String, CodingKey{
        case descriptions = "description"
        case competitor = "competitor"
//        case competitors = ""
    }

}
struct Competitor: Codable{
    let name: String

}
