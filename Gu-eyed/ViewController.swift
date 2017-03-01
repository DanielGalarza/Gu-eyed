//
//  ViewController.swift
//  Gu-eyed
//
//  Created by Patrick Flanagan on 2/20/17.
//  Copyright © 2017 Patrick Flanagan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let wrapper = OpenCVWrapper()
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            let errorLabel = UILabel()
            errorLabel.text = "No camera...😱"
            errorLabel.font = UIFont.systemFont(ofSize: 30)
            errorLabel.sizeToFit()
            errorLabel.textColor = UIColor.white
            errorLabel.center = view.center
            view.addSubview(errorLabel)
//            view.bringSubview(toFront: errorLabel)
            
            return
        }
        wrapper.setTargetView(view);
        wrapper.start();
    }
}
