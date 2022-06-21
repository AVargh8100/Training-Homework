//
//  DetailsViewController.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController{
    @IBOutlet weak var reading: UILabel!
    
    @IBOutlet weak var math: UILabel!
    
    
    @IBOutlet weak var writing: UILabel!
    
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    
    var info: School?

    var score: SATScores?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumber.text = "Phone Number:\(info!.phoneNumber)"
        reading.text = "SAT Reading Scores:\(score!.reading)"
        math.text = "SAT Math Scores:\(score!.math)"
        writing.text = "SAT Writing Scores:\(score!.writing)"
        
      
    }
    
    
}
