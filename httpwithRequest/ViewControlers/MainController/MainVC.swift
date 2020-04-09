//
//  MainVC.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainVC: UICollectionViewController {

    let actions = ["Download image", "GET", "POST", "Github first users", "Upload images"]
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.label.text = actions[indexPath.row]
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        
        switch action {
        case "Download image":
            performSegue(withIdentifier: "ShowImage", sender: self)
        case "GET":
            NetworkManager.getRequest()
            print("GET")
        case "POST":
            NetworkManager.postRequest()
        case "Github first users":
            performSegue(withIdentifier: "OurUsers", sender: self)
        case "Upload images":
            print("Upload image")
        
        default:
            break
        }
    }
}
