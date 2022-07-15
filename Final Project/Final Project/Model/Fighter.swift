//
//  Fighter.swift
//  MMA
//
//  Created by Consultant on 7/5/22.
//

import Foundation


struct Fighter:Codable{
    let firstName: String?
    let lastName: String?
    let nickname: String?
    let birthDate: String?
    let height: Double?
    let weight: Double?
    let reach: Double?
    let wins: Int?
    let losses: Int?
    let draws: Int?
    let technicalKnockouts: Int?
    let technicalKnockoutLosses: Int?
    let submissions: Int?
    let submissionLosses: Int?
    let titleWins: Int?
    let titleLosses: Int?
    let titleDraws: Int?
    let careerStats: Stats?
    
    enum CodingKeys: String, CodingKey{
        case firstName = "FirstName"
        case lastName = "LastName"
        case nickname = "Nickname"
        case birthDate = "BirthDate"
        case height = "Height"
        case weight = "Weight"
        case reach = "Reach"
        case wins = "Wins"
        case losses = "Losses"
        case draws = "Draws"
        case technicalKnockouts = "TechnicalKnockouts"
        case technicalKnockoutLosses = "TechnicalKnockoutLosses"
        case submissions = "Submissions"
        case submissionLosses = "SubmissionLosses"
        case titleWins = "TitleWins"
        case titleLosses = "TitleLosses"
        case titleDraws = "TitleDraws"
        case careerStats = "CareerStats"

        
     }
    
}

struct Stats: Codable{
    let sigStrikesLandedPerMinute: Double?
    let sigStrikeAccuracy: Double?
    let takedownAverage: Double?
    let submissionAverage: Double?
    let knockoutPercentage: Double?
    let technicalKnockoutPercentage: Double?
    let decisionPercentage: Double?
    
    enum CodingKeys: String, CodingKey{
        case sigStrikesLandedPerMinute = "SigStrikesLandedPerMinute"
        case sigStrikeAccuracy = "SigStrikeAccuracy"
        case takedownAverage = "TakedownAverage"
        case submissionAverage = "SubmissionAverage"
        case knockoutPercentage = "KnockoutPercentage"
        case technicalKnockoutPercentage = "TechnicalKnockoutPercentage"
        case decisionPercentage = "DecisionPercentage"

        
     }
}

