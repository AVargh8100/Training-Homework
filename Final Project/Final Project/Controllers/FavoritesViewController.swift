//
//  FavoritesViewController.swift
//  Final Project
//
//  Created by Consultant on 7/10/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var favoriteLabel: UILabel!
    let database = DatabaseHandler()
    var fighters = [Fighter]()
    var newFighter: Fighter?

    
    var favorites: [ProjectCore]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteLabel.font = UIFont(name: "Sternbach", size: 50)
        fetchFighter()
        setUpTableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        favorites = database.fetch(ProjectCore.self)
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
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let current = favorites?[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Sternbach", size: 18)

        cell.textLabel?.text = "\((current?.firstName)!)" + " \((current?.lastName)!)"
        cell.accessoryView?.tintColor = .red
        return cell
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle{
    
        case .delete:
            print("Deleting")
            guard let favorite = favorites?[indexPath.row] else { return }
            tableView.beginUpdates()
            favorites?.remove(at: indexPath.row)
            database.delete(favorite)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()

        @unknown default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecting...")
       // let destination = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        let selectedFighter = favorites?[(self.tableView.indexPathForSelectedRow?.row)!]
        print("\((selectedFighter?.firstName)!)")
        var i = 0
        for fighter in fighters{
            print("looping...")
            
            if selectedFighter?.firstName == fighters[i].firstName && selectedFighter?.lastName == fighters[i].lastName{
                print("\((selectedFighter?.firstName)!)")
                print("\((fighters[i].firstName)!)")

                newFighter = fighter
                
                print(newFighter?.firstName)
                break
            }
            i += 1
            

        }
        
        
        
        performSegue(withIdentifier: "favoritesSegue", sender: self)

        //destination.fighterInfo = detailFighter
//        navigationController?.show(destination, sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailsViewController{

        let detailFighter = Fighter(
            firstName:(newFighter?.firstName),
            lastName:(newFighter?.lastName),
            nickname:(newFighter?.nickname) ?? "None",
            birthDate:(newFighter?.birthDate),
            height:(newFighter?.height) ?? 0,
            weight:(newFighter?.weight) ?? 0,
            reach:(newFighter?.reach) ?? 0,
            wins:Int((newFighter?.wins) ?? 0),
            losses:Int((newFighter?.losses) ?? 0),
            draws:Int((newFighter?.draws) ?? 0),
            technicalKnockouts:Int((newFighter?.technicalKnockouts) ?? 0),
            technicalKnockoutLosses:Int((newFighter?.technicalKnockouts) ?? 0),
            submissions:Int((newFighter?.submissions) ?? 0),
            submissionLosses:Int((newFighter?.submissionLosses) ?? 0),
            titleWins:Int((newFighter?.titleWins) ?? 0),
            titleLosses:Int((newFighter?.titleLosses) ?? 0),
            titleDraws:Int((newFighter?.titleDraws) ?? 0),
            careerStats: newFighter?.careerStats

    
            )
        destination.fighterInfo = detailFighter

        }
    
    }
    
    
    
    
}
