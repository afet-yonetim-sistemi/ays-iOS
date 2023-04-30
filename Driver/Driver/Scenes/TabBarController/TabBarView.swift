//
//  TabBarView.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 30.04.2023.
//

import UIKit

protocol TabBarViewDelegate: AnyObject {
    func selectedIndexChanged(index: Int)
}

class TabBarView: CustomXibView {
    weak var delegate: TabBarViewDelegate?
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.selectedIndexChanged(index: sender.tag)
    }
    
}
