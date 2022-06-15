//
//  RickAndMortyAPI.swift
//  RickAndMorty
//
//  Created by Consultant on 6/14/22.
//

import Foundation
struct RickAndMortyAPI{
    var baseUrl: String
    var character = [Characters]()
    
    init(){
        baseUrl = "https://rickandmortyapi.com/api"
    }
}
    /*
    func fetchCharacter(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/")else{return}
        let task = URLSession.shared.dataTask(with: url){
                data, response, error in
                
                if let data = data, let string = String(data: data, encoding: .utf8){
                    print(string)
                }
            }

            task.resume()
        }

    fetchCharacter()
    }*/
    
    
    
    
    
    
    /*
    func fetchData(){
        let session = URLSession.shared
        guard let url = URL(string: baseUrl)else{
            return}
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else{
                print("Error: \(error?.localizedDescription ?? "No idea what happened")")
                return
            }
            guard let responseData = data else{
                print("Error: did not recieve data")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else{
                print("Error: Not a valid HTTP URL response")
                return
            }
            print("Response status code:\(httpResponse.statusCode)")
            print("Response status debugDescription:\(httpResponse.debugDescription)")
            print("Response status localizedString:\(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
                    do{
                    guard let jsonData = try?
                            JSONSerialization.jsonObject(with: responseData, options: []) else{return}
                guard let jsonArray = jsonData as? [Any] else{
                        return
                }
                    for characterRM in jsonArray{
                        guard let characterDict = characterRM as? [String:Any]
                            else{return}
                        }
                        guard let name = characterDict["id"] as? String else{
                            return
                        }
                        guard let type = characterDict["name"] as? String else{
                            return}
                        guard let city = characterDict["character_type"] as? String else{return}
                        guard let state = characterDict["gender"] as? String else{return}
            
        }
    }*/
    
