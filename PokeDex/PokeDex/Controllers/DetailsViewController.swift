//
//  DetailsViewController.swift
//  PokeDex
//
//  Created by Consultant on 6/17/22.
//

import Foundation
import UIKit

class DetailsViewControll: UIViewController{
    
    
    @IBOutlet weak var pokeImg: UIImageView!
    
    @IBOutlet weak var hpStat: UILabel!
    
    @IBOutlet weak var attackStat: UILabel!
    
    @IBOutlet weak var defenseStat: UILabel!
    
    @IBOutlet weak var specAttackStat: UILabel!
    
    @IBOutlet weak var specDefenseStat: UILabel!
    
    @IBOutlet weak var speedStat: UILabel!
    
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
    }

    
    
    
}
