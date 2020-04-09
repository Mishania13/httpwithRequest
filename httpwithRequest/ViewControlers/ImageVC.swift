//
//  ImageVC.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 08.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiIndicator.color = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        activitiIndicator.isHidden = true
        activitiIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    func fetchImage() {
        
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        
        NetworkManager.downloadImage { (image) in
            DispatchQueue.main.async {
                self.activitiIndicator.stopAnimating()
                self.imageView.image = image
            }
        }
    }
}
