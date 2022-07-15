//
//  ExtensionUrl+Requests.swift
//  MMA
//
//  Created by Consultant on 7/5/22.
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

extension URLSession {
    
    func getFighter<T: Codable>(url: URL?, decoding: T.Type, completion: @escaping (Result<T,Error>)->()) {
        
        guard let url = url else {
            completion(.failure(RequestErrors.badURL))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            
            guard data != nil else {
                completion(.failure(RequestErrors.badData))
                return
            }
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(decoding, from: data!)
                completion(.success(jsonResult))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

