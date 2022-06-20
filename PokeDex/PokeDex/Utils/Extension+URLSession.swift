//
//  Extension+URLSession.swift
//  PokeDex
//
//  Created by Consultant on 6/17/22.
//

import Foundation
extension URLSession{
    enum RequestError: Error{
        case badUrl
        case errorDecode
        case failed(error: Error)
        case unknownError
    }
}
