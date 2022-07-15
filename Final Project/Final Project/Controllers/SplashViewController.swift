//
//  SplashViewController.swift
//  Final Project
//
//  Created by Consultant on 7/8/22.
//

import UIKit

class SplashViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let image = UIImage(named: "logo")
//        imageView.layer.borderWidth = 1.0
//        imageView.layer.masksToBounds = false
//        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo")
       

        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
        animate()
    }
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size

            self.imageView.frame = CGRect(x: -(diffX/2),
                                          y: diffY/2,
                                          width: size,
                                          height: size
            )
        })
        
        
        UIView.animate(withDuration: 1.5, animations:{
            self.imageView.alpha = 0
        }, completion: { done in
            if done{
                DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let MainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
                    MainTabBarController.modalTransitionStyle = .crossDissolve
                    MainTabBarController.modalPresentationStyle = .fullScreen
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(MainTabBarController)
                    
                    
                    
                })
          
               
            }
            
        }
        )
   
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
