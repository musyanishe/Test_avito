//
//  TableViewCell.swift
//  Test_avito
//
//  Created by Евгения Шевцова on 25.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 8, y: 8, width: UIScreen.main.bounds.width - 20, height: 24))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 8, y: 40, width: UIScreen.main.bounds.width, height: 22))
        label.textAlignment = .left
        return label
    }()
    
    lazy var skillsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 8, y: 70, width: UIScreen.main.bounds.width, height: 22))
        label.textAlignment = .left
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(skillsLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}
