//
//  CustomReusableButtonView.swift
//  Driver
//
//  Created by Fatih Doğan on 2.03.2023.
//

import UIKit

/// This is a class to contain custom reusable button view
class CustomReusableButtonView: CustomXibView {
    // MARK: Outlets
    @IBOutlet private weak var reusableButtonImage: UIImageView!
    @IBOutlet private weak var reusableButtonTitle: UILabel!
    // MARK: Properties
    typealias Completion = () -> Void
    private var completion: Completion?
    /**
     Configure custom button
     ## Important Notes ##
     Images are static and exists in assets file
     - Parameters:
     - title: String
     - imageName: String
     - completion: Triggered when view is pressed
     */
    func configureButton(title: String, imageName: String, completion: @escaping Completion) {
        self.completion = completion
        reusableButtonTitle.text = title
        reusableButtonImage.image = UIImage(named: imageName)
    }
   
    @IBAction private func reusableButtonTapped(_ sender: UIButton) {
        completion?()
    }
}
