//
//  DetailsViewController.swift
//  PokeDex
//
//  Created by Consultant on 6/17/22.
//

import Foundation
import UIKit

class DetailsViewControll: UIViewController{
   
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var pokeImg: UIImageView!
    

    
    @IBOutlet weak var hpStat: UILabel!
    
    @IBOutlet weak var attackStat: UILabel!
    
    @IBOutlet weak var defenseStat: UILabel!
    
    @IBOutlet weak var specAttackStat: UILabel!
    
    @IBOutlet weak var specDefenseStat: UILabel!
    
    @IBOutlet weak var speedStat: UILabel!

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var pokeId: UILabel!
    
    @IBOutlet weak var pokeType: UILabel!
    
    
    
    var pokeInfo: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeImg.loadUrl(from: (pokeInfo?.spriteUrl)!)
        hpStat.text = "HP: \((pokeInfo?.baseStats[0])!)"
        attackStat.text = "ATT: \((pokeInfo?.baseStats[1])!)"
        defenseStat.text = "DEF: \((pokeInfo?.baseStats[2])!)"
        specAttackStat.text = "SP. ATT: \((pokeInfo?.baseStats[3])!)"
        specDefenseStat.text = "SP. DEF: \((pokeInfo?.baseStats[4])!)"
        speedStat.text = "SPD: \((pokeInfo?.baseStats[5])!)"
        
        name.text = "\((pokeInfo?.name)!)"
        pokeId.text = "ID: \((pokeInfo?.id)!)"
        pokeType.text  = "\((pokeInfo?.types.joined(separator: "/").capitalized)!)"
        setUpTableView()
    }
    
    
    
    func setUpTableView(){
         tableView.delegate = self
         tableView.dataSource = self
         
     }

    
    
    
}
extension DetailsViewControll: UITableViewDelegate, UITableViewDataSource{
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeInfo!.moves.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath)

        cell.textLabel?.text = pokeInfo?.moves[indexPath.row].capitalized
        return cell
    }
    
    
    
    
    
}
