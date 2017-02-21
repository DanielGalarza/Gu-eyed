//
//  ViewController.swift
//  Gu-eyed
//
//  Created by Patrick Flanagan on 2/20/17.
//  Copyright © 2017 Patrick Flanagan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = OpenCVWrapper.openCVVersionString()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
}

