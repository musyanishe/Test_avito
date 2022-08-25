//
//  TableViewCell.swift
//  Test_avito
//
//  Created by Евгения Шевцова on 25.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var skillsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 16, y: 6, width: UIScreen.main.bounds.width - 30, height: 100))
        view.backgroundColor = .yellow
        return view
    }()
    

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 20
        backView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(phoneLabel)
        self.contentView.addSubview(skillsLabel)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}
