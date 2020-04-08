//
//  ViewController.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 08.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urls = URLS()
    @IBOutlet weak var loadImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageButton.titleLabel?.numberOfLines = 0
        loadImageButton.titleLabel?.textAlignment = .center
    }
    
    @IBAction func getRequest() {
        
        guard let url = URL(string: urls.getURL) else {return}
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    @IBAction func postRequest() {
        
    }
}

