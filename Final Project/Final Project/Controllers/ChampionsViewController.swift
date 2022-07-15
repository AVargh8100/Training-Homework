//
//  ChampionsViewController.swift
//  MMA
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class ChampionsViewController: UIViewController {

//@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var championLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var champions = [Promotion]()
    var weightClasses = [WeightClass]()
   // var champName = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        championLabel.font = UIFont(name: "Sternbach", size: 50)

        setUpTableView()
        fetchFighter()
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    func fetchFighter(){
        let url = ApiEndpoints.championUrl
       
        URLSession.shared.getFighter(url: url, decoding: ApiRequest.self){
            [weak self] result in
            switch result{
            case .success(let requestUser):
                if let weightClass = requestUser.categories[0].weightClass{
                    self?.weightClasses.append(contentsOf: weightClass)

                }
                    
                    
                    
               // print(self?.users?.results[0].gender)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):

                print(error)
            }
        }
        
    }
}




    
    
    
extension ChampionsViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weightClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        print(champions.count)
//        for i in 0..<(champions.count)-1{
//
//        self.champName.append(champions[i].weightClass?[i].competitor["name"] ?? "")
//        print(champions[i].weightClass?[i].competitor["name"] ?? "")
//        }
        cell.textLabel?.font = UIFont(name: "Sternbach", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Sternbach", size: 10)

        cell.textLabel?.text = weightClasses[indexPath.row].competitor.name
        cell.detailTextLabel?.text = weightClasses[indexPath.row].descriptions.capitalized

        //champions[indexPath.row].weightClass?[indexPath.row].competitor.name
        return cell
    }
    
    
    
}
