//
//  UIImageView+.swift
//  Driver
//
//  Created by Fatih Doğan on 3.03.2023.
//

import UIKit.UIImageView
import Kingfisher

extension UIImageView {
    /**
     Cancel Kingfisher's image download task
     */
    func cancelDownloadKFTask() {
        self.kf.cancelDownloadTask()
    }
    
    /**
     Kingfisher downloads image from a url
     - parameters:
     - imageUrlString: String
     - placeholder: String
     - success: Triggered when result is success
     - failure: Triggered when result is success and return error
     */
    func kfSetImage(from imageUrlString: String, placeholder: String?, success: (()->Void)? = nil, failure: ((Error)->Void)? = nil ){
        self.kf.setImage(with: URL(string: imageUrlString), placeholder: UIImage(named: placeholder ?? ""), completionHandler:  { result in
            switch result{
            case .success:
                success?()
            case .failure(let error):
                failure?(error)
            }
        })
    }
}
