//
//  SchoolInfo.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation
struct SATScores:Codable{
    let reading: String
    let math: String
    let writing: String
    
    
    enum CodingKeys: String, CodingKey{
        case reading = "sat_critical_reading_avg_score"
        case math = "sat_math_avg_score"
        case writing = "sat_writing_avg_score"
    }
}
