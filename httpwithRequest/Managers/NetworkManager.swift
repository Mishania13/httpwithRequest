//
//  NetworkManager.swift
//  httpwithRequest
//
//  Created by Mr. Bear on 09.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class NetworkManager {
    
    // MARK: - Requests
    static func getRequest() {
        
        let urls = URLS()
        
        guard let url = URL(string: urls.getPostURL) else {return}
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
    
    static func postRequest() {
        
        let urls = URLS()
        
        guard let url = URL(string: urls.getPostURL) else {return}
        
        let userData = ["Lets" : "Try to", "Make" : "Post Request"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(
            withJSONObject: userData, options: []
            ) else {return}
        
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else {return}
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    //MARK: - Working with image
    static func downloadImage (complition: @escaping (_ image: UIImage) -> ()) {
        
        let urls = URLS()
        guard let url = URL(string: urls.imageURL) else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                complition(image)
            }
        } .resume()
    }
    
    //MARK: - Working with json requests
    
    static func fetchData(complition: @escaping (_ profilesList:[GitProfilesList])->()) {
        
        let urls = URLS()
        let jsonUrlString = urls.gitHubUsersList
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let profilesList = try decoder.decode([GitProfilesList].self, from: data)
                
             complition(profilesList)
                
            } catch let error {
                print(error)
            }
        } .resume()
    }
    
    static func uploadImage(url: String) {
        let image = UIImage(named: "CakeImage")!
        let httpHeaders = ["Authorization": "Client-ID f7e0a8523e76c0d"]
        
        guard let imageProperties = ImageProperties(
            withImage: image, forKey: "image"
            ) else {return}
        
        guard let url = URL(string: url) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = httpHeaders
        request.httpBody = imageProperties.data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

