//
//  School.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation
struct School:Codable{
    let name: String
    let phoneNumber: String
    let email: String?
    
    
    enum CodingKeys: String, CodingKey{
        case name = "school_name"
        case phoneNumber = "phone_number"
        case email = "school_email"
    }
}
