//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class ViewController: UIViewController {

 
  
    @IBOutlet weak var tableView: UITableView!
    
    var chars = [Characters]()
    var charInfo: Characters?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData()
        //fetchCharacter()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
    //https://rickandmortyapi.com/api/character?page=1
        let session = URLSession.shared
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=rick&status=alive") else { return }
        
            let task = session.dataTask(with: url) {
                data, response, error in
                
                guard error == nil else {
                    print("Error: \(error?.localizedDescription ?? "No idea what happened")")
                    
                    return
                }
                
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Error: not a valid HTTP URL Response")
                    return
                }
                
                print("Response status code: \(httpResponse.statusCode)")
                print("Response status debugDescription: \(httpResponse.debugDescription)")
                print("Response status localizedString: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
                
                
                do {
                    
                    guard let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) as? [String:Any] else { return }
                    
                    //guard let info = jsonData["info"] as? [String:Any] else { return }
                    //var url = info["next"] as? String?
                        
                    guard let jsonArray = jsonData["results"] as? [[String:Any]] else { return }
                    //print(jsonArray)
                    for result in jsonArray {
                        guard let getResults = result as? [String:Any] else { return }
                       //
                        guard let name = getResults["name"] as? String else { return }
                        guard let status = getResults["status"] as? String else { return }
                        guard let gender = getResults["gender"] as? String else { return }

                        
                      //if status == "Alive"{
                        self.chars.append(Characters(name: name, status: status, gender: gender))
                        //print("I AM HERE! \(self.chars)")
                       // }
                    }
                    DispatchQueue.main.async {
                        self.tableView.backgroundColor = .cyan
                        self.tableView.reloadData()
                    }
                    //guard let info = jsonData["info"] as? [String:Any] else { return }
                    //url = info["next"] as? String?
                        
                    
                }
                
                
                
            }
            task.resume()
        
        
    }
    
    
    
    

}




extension ViewController:UITableViewDelegate, UITableViewDataSource{
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
                  //  print("I AM COUNT! \(chars.count)")

                    return chars.count
                }
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  //  print("I AM HERE! \(chars[indexPath.row].name)")

                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                    cell.textLabel?.text = chars[indexPath.row].name
                    cell.detailTextLabel?.text = "\(chars[indexPath.row].status),\(chars[indexPath.row].gender)"
                    return cell
                }
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        let sendInfo = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        sendInfo.charInfo = chars[indexPath.row]
        navigationController?.pushViewController(sendInfo, animated: true)
        
    }
                  
                
}

/*extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chars.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        charInfo = chars[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: Any?.self)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = chars[indexPath.row].name
        cell.detailTextLabel?.text = ""
        return cell
    }
}*/
