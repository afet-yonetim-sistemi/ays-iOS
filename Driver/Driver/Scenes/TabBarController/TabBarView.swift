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
    @IBOutlet private weak var mapView: UIView!
    @IBOutlet private weak var messageView: UIView!
    @IBOutlet private weak var settingsView: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    
    override func layoutSubviews() {
        mapView.backgroundColor = .systemTeal
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction
    private func buttonPressed(_ sender: UIButton) {
        delegate?.selectedIndexChanged(index: sender.tag)
        switch sender.tag {
        case 0:
            setBackgroundColor(selectedView: mapView)
        case 1:
            setBackgroundColor(selectedView: messageView)
        case 2:
            setBackgroundColor(selectedView: settingsView)
        default:
            fatalError()
        }
    }
    
    private func setBackgroundColor(selectedView: UIView) {
        let views = [mapView, messageView, settingsView]
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            views.filter({$0 != selectedView}).forEach({$0?.backgroundColor = .white})
            selectedView.backgroundColor = .systemTeal
        }
    }
}
