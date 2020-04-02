//
//  NetworkManager.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var downloadedImagesDict = [String: UIImage]()
    
    func getSections(completed: @escaping ([Section]?) -> Void) {
        
        guard let baseURL = URL(string: "https://s3.amazonaws.com") else { completed(nil); return }
        
        // Final endpoint is https://s3.amazonaws.com/shrekendpoint/news.json
        var finalURL = baseURL
        finalURL.appendPathComponent("shrekendpoint")
        finalURL.appendPathComponent("news")
        finalURL.appendPathExtension("json")
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if let error = error {
                print("There was an error in \(#function) with the url \(error) \(error.localizedDescription)")
                completed(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { completed(nil); return}
            
            guard let data = data else {
                print("There was an error in \(#function). There was no data.")
                completed(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let topLevel = try decoder.decode(TopLevel.self, from: data)
                let sections = topLevel.data
                completed(sections)
            } catch {
                print("There was an error decoding JSON in \(#function). \n Error: \(error), \n Error Localized Description: \(error.localizedDescription)")
                completed(nil)
                return
            }
        }
        
        dataTask.resume()
    }
    
    func downloadPreviewImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        guard self.downloadedImagesDict[urlString] == nil else {
            let image = self.downloadedImagesDict[urlString]
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else { completed(nil); return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else { completed(nil); return }
            
            self.downloadedImagesDict[urlString] = image
            completed(image)
            return
        }
        
        dataTask.resume()
    }
}
