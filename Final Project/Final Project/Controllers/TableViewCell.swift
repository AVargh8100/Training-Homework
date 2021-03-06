//
//  TableViewCell.swift
//  MMA
//
//  Created by Consultant on 7/5/22.
//

import Foundation
import UIKit
protocol PassDataToList{
   func passSelectedRowData(cell: UITableViewCell)
}
class TableViewCell: UITableViewCell{
    
    var link: ViewController?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = .red
        let starButton = UIButton(type: .system)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
    @objc private func handleMarkAsFavorite(){
        //print("Marking as favorite")
        link?.passSelectedRowData(cell: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
