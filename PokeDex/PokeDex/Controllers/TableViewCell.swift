//
//  TableViewCell.swift
//  PokeDex
//
//  Created by Consultant on 6/18/22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell{
    var pokemon: Pokemon?
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension UIImageView{
    func loadUrl(from urlString: String, contentMode mode: ContentMode = .scaleAspectFit ){
       // contentMode = mode
        guard let url = URL(string: urlString )else{
            return
        }
        DispatchQueue.global().async{[weak self] in
            if let data = try? Data(contentsOf: url){ 
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image

                    }
                }
            }
        }
        
    }
}

