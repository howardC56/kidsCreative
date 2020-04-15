//
//  DetailViewController.swift
//  kidsCreative
//
//  Created by Howard Chang on 4/13/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let detailView = DetailView()
    var imagePicker = UIImagePickerController()
    
    
    
    override func loadView() {
        view = detailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.submitButton.addTarget(self, action: #selector(submitButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func submitButtonPressed(_ sender: UIButton) {
        openCameraOptions()
    }
    
    func openCameraOptions() {
        // add logic to add photo or video from camera
    }
    
    
    
    
}

