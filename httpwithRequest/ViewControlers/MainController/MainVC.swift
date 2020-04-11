//
//  MainVC.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

enum Actions: String, CaseIterable {
    case DownloadImage = "Download image"
    case GET = "GET"
    case POST = "POST"
    case GithubFirstUsers = "Github first users"
    case UploadImages = "Upload images"
    case downloadFile = "Download File"
}

private let reuseIdentifier = "Cell"

class MainVC: UICollectionViewController {

    let actions = Actions.allCases
    private var alert: UIAlertController!
    
    private func showAlert() {
        alert = UIAlertController(title: "Downloading", message: "0%", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "Cancle", style: .destructive)
        
        alert.addAction(cancleAction)
        present(alert, animated: true)
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.label.text = actions[indexPath.row].rawValue
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        let urls = URLS()
        switch action {
        case .DownloadImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .GET:
            NetworkManager.getRequest()
            print("GET")
        case .POST:
            NetworkManager.postRequest()
        case .GithubFirstUsers:
            performSegue(withIdentifier: "OurUsers", sender: self)
        case .UploadImages:
            NetworkManager.uploadImage(url: urls.uploadImageUrl)
        case .downloadFile:
            showAlert()
            print("downloading")
        }
    }
}
