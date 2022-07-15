//
//  DetailsViewController.swift
//  Final Project
//
//  Created by Consultant on 7/7/22.
//

import Foundation
import UIKit
class DetailsViewController:UIViewController{

    
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var draws: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet weak var finishes: UILabel!
    @IBOutlet weak var finished: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var fighterBio: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var reach: UILabel!
    
    
    @IBOutlet weak var careerStatLab: UILabel!
    @IBOutlet weak var titleWins: UILabel!
    @IBOutlet weak var titleLosses: UILabel!
    @IBOutlet weak var titleDraws: UILabel!
    @IBOutlet weak var tkos: UILabel!
    @IBOutlet weak var submissions: UILabel!
    @IBOutlet weak var sigPM: UILabel!
    @IBOutlet weak var sigAcc: UILabel!
    @IBOutlet weak var tdAvg: UILabel!
    @IBOutlet weak var subAvg: UILabel!
    @IBOutlet weak var koPerc: UILabel!
    
    
    
    
    
    
    
    
    
    
    var fighterInfo: Fighter?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 8
        imageView.backgroundColor = .lightGray
        name.font = UIFont(name: "Sternbach", size: 18)

        name.text = "\((fighterInfo?.firstName)!)" + " \((fighterInfo?.lastName)!)"
        wins.text = "\((fighterInfo?.wins)!)"
        losses.text = "\((fighterInfo?.losses)!)"
        draws.text = "\((fighterInfo?.draws)!)"
        finishes.text = "\((fighterInfo?.technicalKnockouts)!) TKOs"
        finished.text = "\((fighterInfo?.technicalKnockoutLosses)!) TKOs"

        
        
        //BIO
        fighterBio.layer.borderColor = UIColor.black.cgColor
        fighterBio.layer.borderWidth = 2
        nickName.layer.borderColor = UIColor.black.cgColor
        nickName.layer.borderWidth = 2
        birthDate.layer.borderColor = UIColor.black.cgColor
        birthDate.layer.borderWidth = 2
        weight.layer.borderColor = UIColor.black.cgColor
        weight.layer.borderWidth = 2
        height.layer.borderColor = UIColor.black.cgColor
        height.layer.borderWidth = 2
        reach.layer.borderColor = UIColor.black.cgColor
        reach.layer.borderWidth = 2
        
        nickName.text = "Alias: \((fighterInfo?.nickname) ?? "None")"
        birthDate.text = "BirthDay: \((fighterInfo?.birthDate)!)"
        weight.text = "Weight: \((fighterInfo?.weight)!)"
        height.text = "Height: \((fighterInfo?.height)! + 80)"
        reach.text = "Reach: \((fighterInfo?.reach)! + 80)"
        
        // Career Stats
        careerStatLab.layer.borderColor = UIColor.black.cgColor
        careerStatLab.layer.borderWidth = 2
        titleWins.layer.borderColor = UIColor.black.cgColor
        titleWins.layer.borderWidth = 2
        titleLosses.layer.borderColor = UIColor.black.cgColor
        titleLosses.layer.borderWidth = 2
        titleDraws.layer.borderColor = UIColor.black.cgColor
        titleDraws.layer.borderWidth = 2
        tkos.layer.borderColor = UIColor.black.cgColor
        tkos.layer.borderWidth = 2
        submissions.layer.borderColor = UIColor.black.cgColor
        submissions.layer.borderWidth = 2
        sigPM.layer.borderColor = UIColor.black.cgColor
        sigPM.layer.borderWidth = 2
        sigAcc.layer.borderColor = UIColor.black.cgColor
        sigAcc.layer.borderWidth = 2
        tdAvg.layer.borderColor = UIColor.black.cgColor
        tdAvg.layer.borderWidth = 2
        subAvg.layer.borderColor = UIColor.black.cgColor
        subAvg.layer.borderWidth = 2
        koPerc.layer.borderColor = UIColor.black.cgColor
        koPerc.layer.borderWidth = 2
        
        
        titleWins.text = "Title Wins: \((fighterInfo?.titleWins)!)"
        titleLosses.text = "Title Losses: \((fighterInfo?.titleLosses)!)"
        titleDraws.text = "Title Draws: \((fighterInfo?.titleDraws)!)"
        tkos.text = "TKOs: \((fighterInfo?.technicalKnockouts)!)"
        submissions.text = "Submissions: \((fighterInfo?.submissions)!)"
        sigPM.text = "Sig Strikes Per Minute: \((fighterInfo?.careerStats?.sigStrikesLandedPerMinute)!)"
        sigAcc.text = "Sig Strike Accuracy: \((fighterInfo?.careerStats?.sigStrikeAccuracy)!)"
        tdAvg.text = "TD Average: \((fighterInfo?.careerStats?.takedownAverage)!)"
        subAvg.text = "Submission Avg: \((fighterInfo?.careerStats?.submissionAverage)!)"
        koPerc.text = "KO Percentage: \((fighterInfo?.careerStats?.knockoutPercentage)!)%"


        
        
        
        
        

        
        
    }
    
}
