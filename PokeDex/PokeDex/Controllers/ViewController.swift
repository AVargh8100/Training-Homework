//
//  ViewController.swift
//  PokeDex
//
//  Created by Consultant on 6/17/22.
//

import UIKit

class ViewController: UIViewController {
    var offset: Int = 0
    var max: Int = 30
    var scrollMax = false
    @IBOutlet weak var tableView: UITableView!
    
      
    var pokemon = [Pokemon]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchPokeInfo()
  
    }
    
   func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchPokeInfo(completed: ((Bool)-> Void)? = nil){
        for i in (self.offset..<(self.offset + self.max)){
            let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
            let url = ("\(baseUrl)"+"\(i+1)")
            let newUrl = URL(string: url)
            //let session = URLSession.shared
        URLSession.shared.getRequest(url: newUrl){ results in
            switch results{
            case .success(let result):
                DispatchQueue.main.async {
                    let name = result["name"] as! String
                    let sprites = result["sprites"] as! [String:Any]
                    let spriteUrl = sprites["front_default"] as! String
                    let typeObj = result["types"] as! [[String:Any]]
                    var types:[String] = []
                    for item in typeObj{
                        let type = item["type"] as! [String: String]
                        types.append(type["name"]!)
                    }
                    
                    let statObj = result["stats"] as! [[String:Any]]
                    //var stats:[String] = []
                    var baseStats:[Int] = []
                    for item in statObj{
                        let baseStat = item["base_stat"] as! Int
                        baseStats.append(baseStat)
             
                    }
                    
                    let pokemonInfo = Pokemon(name: name, spriteUrl: spriteUrl, types: types,  baseStats: baseStats)
                    self.pokemon.append(pokemonInfo)
                    self.scrollMax = self.offset == 150
                    self.offset = self.offset + 1 <= 150 ? self.offset + 1 : 150
                    self.max = self.offset == 150 ? 1 : 30
                    self.tableView.reloadData()
                    
                    
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
            
            
            
        }
        
        }
    }
    
    
    
    
    }









extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    enum LoadMore: Int{
        case list
        case loader
        case endOfList
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let loadMore = LoadMore(rawValue: section) else {return 0}
        switch loadMore{
            case .list:
                return pokemon.count
            case .loader:
                return pokemon.count >= max && !scrollMax ? 1 : 0
            case .endOfList:
                return offset == 150 ? 1 : 0
    }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = LoadMore(rawValue: indexPath.section) else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch section{
            case .list:
            
            cell.textLabel?.text = pokemon[indexPath.row].name
            cell.imageView?.loadUrl(from: pokemon[indexPath.row].spriteUrl)
            cell.detailTextLabel?.text = pokemon[indexPath.row].types.joined(separator: "/")
            
            case .loader:
                cell.textLabel?.text = "Loading..."
            case .endOfList:
                cell.textLabel?.text = ""
        }

        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       guard let section = LoadMore(rawValue: indexPath.section) else {return}
        guard !pokemon.isEmpty else {return}
        
        if section == .loader{
            if(!scrollMax){
                fetchPokeInfo(){[weak self] success in
                    if !success{
                        self?.hideBottomLoader()
                    }
                    
                }
            }
        }
        
    }
    private func hideBottomLoader(){
        DispatchQueue.main.async{
            let lastListIndexPath = IndexPath(row: self.pokemon.count - 1, section: LoadMore.list.rawValue )
            self.tableView.scrollToRow(at: lastListIndexPath, at: .bottom, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewControll{
            destination.pokeInfo = pokemon[(tableView.indexPathForSelectedRow?.row)!]

    
        }
            
    }
    
    
    
}


