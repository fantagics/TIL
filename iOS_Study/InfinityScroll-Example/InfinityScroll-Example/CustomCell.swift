//
//  CustomCell.swift
//  InfinityScroll-Example
//
//  Created by 이태형 on 2022/09/14.
//

import UIKit

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
