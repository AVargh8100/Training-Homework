//
//  ApiCaller.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//
//"https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
import Foundation
class ApiCaller{
    func fetchJson(from url: String, completed: @escaping(Data?) -> (Void)){
        
        
        guard let url = URL(string: url) else{
            print("Url Error", url)
            return}
        let session = URLSession.shared
        
        let task = session.dataTask(with: url){ data, response, error in
            guard error == nil else{
                print("Error:\(error?.localizedDescription ?? "Something strange happened")")
                return
            }
            guard let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) else {
                print("server error!")
                return
            }
            guard data != nil else{
                print("Error: We have no data")
                return
            }
                           
                    completed(data)
                
                
            
            
        }
        task.resume()
        
        
    }
    
    
    func fetchSchool(completed: @escaping ([School]) -> (Void)){
        let url =  "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        fetchJson(from: url){ data in
            //print(self.schools)
            do {
                let results = try JSONDecoder().decode([School].self, from: data!)
               // print(self.schools)

                DispatchQueue.main.async{
                    completed(results)
                }
            }catch{
                print("Error: \(error.localizedDescription)")
               // print(self.schools)
            }
            
            
        }
        
    
}
    
    
    func fetchSAT(completed: @escaping ([SATScores]) -> (Void)){
        let url = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        

        fetchJson(from: url){ data in

            //print(self.schools)
            do {
                let results = try JSONDecoder().decode([SATScores].self, from: data!)
               // print(self.schools)

                DispatchQueue.main.async{
                    completed(results)
                }
                
                
            } catch{
                print("Error: \(error.localizedDescription)")
               // print(.schools)
            }
            
            
        }
  
        
        
    }

}

    

