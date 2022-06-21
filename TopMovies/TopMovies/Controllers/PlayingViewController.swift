//
//  PlayingViewController.swift
//  TopMovies
//
//  Created by Consultant on 6/16/22.
//

import Foundation
import UIKit

class PlayingViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var response2: requestPlaying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchTop()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchTop(){
        URLSession.shared.getRequest(url: APIEndpoints.nowPlaying, decoding: requestPlaying.self){
            [weak self] result in
            switch result{
            case .success(let requestPlaying):
                self?.response2 = requestPlaying
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension PlayingViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response2?.results.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = response2?.results[indexPath.row].title
        return cell
    }
  
}
