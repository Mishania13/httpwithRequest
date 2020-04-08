//
//  ImageVC.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 08.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {
    
    //ssssss
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiIndicator.isHidden = true
        activitiIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    func fetchImage() {
        
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        let urls = URLS()
        guard let url = URL(string: urls.imageURL) else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activitiIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        } .resume()
    }
}

