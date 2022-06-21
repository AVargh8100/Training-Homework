//
//  ViewController.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var tableView: UITableView!
  
    var schools = [School]()
    var scores = [SATScores]()
    var fetchingMore = false
    
    //var nextPageToLoad = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
       
    
    func fetchData(){
        
        ApiCaller().fetchSchool(){results in
            self.schools = results ?? []
            
            self.tableView.reloadData()
            
        }
        ApiCaller().fetchSAT(){results in
            self.scores = results ?? []
        }
    
    }
    
   

}
}

   
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return schools.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = schools[indexPath.row].name
        
        return cell
    }
    
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            destination.info = schools[(tableView.indexPathForSelectedRow?.row)!]

            destination.score = scores[(tableView.indexPathForSelectedRow?.row)!]
        }
            
    }
    
    
 
}

