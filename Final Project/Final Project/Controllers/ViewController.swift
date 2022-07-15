//
//  ViewController.swift
//  MMA
//
//  Created by Consultant on 7/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var fighterLabel: UILabel!
    
    var fighters = [Fighter]()
    let database = DatabaseHandler()

    var favorites = [ProjectCore](){
        didSet{
            self.tableView.reloadData()
        }
    }
    //var filteredData =  [Fighter]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fighterLabel.font = UIFont(name: "Sternbach", size: 50)

        setUpTableView()
        fetchFighter()
        
        
        
    }
    
    func setUpTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        //searchBar.delegate = self
    }
    func fetchFighter(){
        //let fightUrl = ApiEndpoints.fighterUrl
        let url = ApiEndpoints.fighterUrl
        URLSession.shared.getFighter(url: url, decoding: [Fighter].self){
            [weak self] result in
            switch result{
            case .success(let requestUser):
                self?.fighters.append(contentsOf: requestUser)
               // self?.filteredData.append(contentsOf: requestUser)
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

extension ViewController: UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fighters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.link = self
        let current = fighters[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Sternbach", size: 18)
        cell.textLabel?.text = "\((fighters[indexPath.row].firstName)!)" + " \((fighters[indexPath.row].lastName)!)"
        
        cell.accessoryView?.tintColor = (favorites.contains(where: { $0.firstName == current.firstName && $0.lastName == current.lastName})) ? .red : .gray

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        destination.fighterInfo = fighters[indexPath.row]
        navigationController?.show(destination, sender: nil)

    }
    
    
}
extension ViewController: PassDataToList{
    func passSelectedRowData(cell: UITableViewCell) {
        let tappedIndex = tableView.indexPath(for: cell)!.row
        let currentFighter = fighters[tappedIndex]
        //print(currentFighter.firstName)
        if let index = favorites.firstIndex(where: {$0.firstName == currentFighter.firstName}){
            database.delete(favorites[index])
            favorites.remove(at: index)
        }else{
            guard let newFavorite = database.add(ProjectCore.self) else { return }
            newFavorite.firstName = currentFighter.firstName
            newFavorite.lastName = currentFighter.lastName
            newFavorite.nickname = currentFighter.nickname
            newFavorite.birthDate = currentFighter.birthDate
            newFavorite.height = currentFighter.height ?? 0
            newFavorite.weight = currentFighter.weight ?? 0
            newFavorite.reach = currentFighter.reach ?? 0
            newFavorite.wins = Int16(currentFighter.wins ?? 0)
            newFavorite.losses = Int16(currentFighter.wins ?? 0)
            newFavorite.draws = Int16(currentFighter.wins ?? 0)
            newFavorite.technicalKnockouts = Int16(currentFighter.wins ?? 0)
            newFavorite.technicalKnockoutLosses = Int16(currentFighter.wins ?? 0)
            newFavorite.submissions = Int16(currentFighter.wins ?? 0)
            newFavorite.submissionLosses = Int16(currentFighter.wins ?? 0)
            newFavorite.titleWins = Int16(currentFighter.wins ?? 0)
            newFavorite.titleLosses = Int16(currentFighter.wins ?? 0)
            newFavorite.titleDraws = Int16(currentFighter.wins ?? 0)
            
            newFavorite.sigStrikeAccuracy = currentFighter.careerStats?.sigStrikeAccuracy ?? 0
            newFavorite.sigStrikesLandedPerMinute = currentFighter.careerStats?.sigStrikesLandedPerMinute ?? 0
            newFavorite.takedownAverage = currentFighter.careerStats?.takedownAverage ?? 0
            newFavorite.submissionAverage = currentFighter.careerStats?.submissionAverage ?? 0
            newFavorite.knockoutPercentage = currentFighter.careerStats?.knockoutPercentage ?? 0
            newFavorite.technicalKnockoutPercentage = currentFighter.careerStats?.technicalKnockoutPercentage ?? 0
            newFavorite.decisionPercentage = currentFighter.careerStats?.decisionPercentage ?? 0

            
            


            
            
            favorites.append(newFavorite)
            database.save()
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
         
    }
}


