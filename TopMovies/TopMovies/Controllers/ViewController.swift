//
//  ViewController.swift
//  TopMovies
//
//  Created by Consultant on 6/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var response: requestMovie?
    var nextPageToLoad = 1
    var currentlyLoading = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchTop()
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchTop(){
        URLSession.shared.getRequest(url: APIEndpoints.topMovie, decoding: requestMovie.self){
            [weak self] result in
            switch result{
            case .success(let requestMovie):
                self?.response = requestMovie
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.nextPageToLoad += 1
                }
            case .failure(let error):
                
                print(error)
            }
        }
    }

    
    
    
    
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.results.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = response?.results[indexPath.row].title
        return cell
    }
    
  
}
