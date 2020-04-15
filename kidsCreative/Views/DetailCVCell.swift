//
//  DetailCVCell.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/15/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailCVCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        
    }
    
}