//
//  Data.swift
//  APIcallfetchJSON
//
//  Created by vincent schmitt on 02/07/2021.
//

import SwiftUI


struct Post: Codable, Identifiable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

class Api {
    func getPosts(completion:@escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
            let posts = try JSONDecoder().decode([Post].self, from: data!)
            //print(posts)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            } catch {
                print(error)
            }
        }
        .resume()
    }
}
