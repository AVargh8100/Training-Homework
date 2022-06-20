//
//  ExtensionURL+Requests.swift
//  PokeDex
//
//  Created by Consultant on 6/17/22.
//

import Foundation
extension URLSession{
    
    func getRequest(url:URL?, completion:@escaping(Result<[String: Any],Error>)->()){
        guard let url = url else {
            completion(.failure(RequestError.badUrl))
            return
        }
        let urlRequest = URLRequest(url: url, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error{
                completion(.failure(RequestError.failed(error: error)))
                
            }
        
            guard data != nil else{
                completion(.failure(RequestError.unknownError))
                return
            }
            do{
                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: [])
                let parsedData = jsonResult as! [String: Any]
                completion(.success(parsedData))
            }catch{
                completion(.failure(RequestError.errorDecode))
            }
            
            
            
        }.resume()
        
        
    }
        
    
    
    
    
}
