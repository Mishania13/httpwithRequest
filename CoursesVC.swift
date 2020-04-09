//
//  CoursesVC.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 08.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class CoursesVC: UIViewController {
    
    private var profilesList = [GitProfilesList]()
    private let urlsList = URLS()
    private var userUrl: String?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    private func fetchData() {
        NetworkManager.fetchData { (profilesList) in
            self.profilesList = profilesList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func configurateCell (cell: TableViewCell, for indexPath: IndexPath) {
        
        let profile = profilesList[indexPath.row]
        cell.userName.text = "Username: \(profile.login.capitalized)"
        cell.userId.text = "ID: \(profile.id)"
        
        DispatchQueue.global().async {
            
            guard let imageUrl = URL(string: profile.avatarUrl) else {return}
            guard let imageData = try? Data.init(contentsOf: imageUrl) else {return}
            
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let webVC = segue.destination as! WebVC
        
        if let url = userUrl {
            webVC.userUrl = url
        }
    }
    
    
}

// MARK: Table View Data Source

extension CoursesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        configurateCell(cell: cell, for: indexPath)
        
        return cell
    }
}

// MARK: Table View Delegate

extension CoursesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let profile = profilesList[indexPath.row]
        
        userUrl = profile.htmlUrl
        
        performSegue(withIdentifier: "WebSegue", sender: self)
        
    }
}



