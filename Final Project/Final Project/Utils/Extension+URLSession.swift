//
//  Extension+URLSession.swift
//  MMA
//
//  Created by Consultant on 7/5/22.
//

import Foundation

extension URLSession{
    enum RequestError: Error{
        case badUrl
        case errorDecode
        case failed(error: Error)
        case unknownError
    }
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}

