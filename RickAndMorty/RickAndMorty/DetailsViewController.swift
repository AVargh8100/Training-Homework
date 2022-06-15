//
//  DetailsViewController.swift
//  RickAndMorty
//
//  Created by Consultant on 6/14/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charStatus: UILabel!
    
    @IBOutlet weak var charGender: UILabel!
    var charInfo: Characters = Characters(name:"", status:"", gender:"")
override func viewDidLoad() {
    super.viewDidLoad()
    
    charName.text = charInfo.name
    charStatus.text = charInfo.status
    charGender.text = charInfo.gender

  /*  bType.text = brewerInfo.type
    bCity.text = brewerInfo.city
    bState.text = brewerInfo.state*/

    // Do any additional setup after loading the view.


    }
}
