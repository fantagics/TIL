//
//  CustomTableViewCell.swift
//  RatingAppByCode
//
//  Created by 이태형 on 2022/08/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let myTitle = UILabel()
    let mySubtitle = UILabel()
    let myImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myTitle)
        contentView.addSubview(mySubtitle)
        contentView.addSubview(myImageView)
        
        myTitle.frame = CGRect(x: 12, y: 2, width: 0, height: 0)
        mySubtitle.frame = CGRect(x: 12, y: 24, width: 0, height: 0)
        myImageView.frame = CGRect(x: contentView.frame.maxX - 50, y: contentView.frame.midY - 12, width: 80, height: 24)
        
        mySubtitle.font = UIFont.systemFont(ofSize: 13)
        myImageView.contentMode = .scaleAspectFit
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
}
