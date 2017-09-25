//
//  Movie.swift
//  MovieDB
//
//  Created by Tanja Keune on 9/24/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import Foundation

public struct Movie {
    
    static let APIKEY = "7565954194cd86a454cc1353a50b1a93"
    public var title: String!
    public var imagePath: String!
    public var description: String!
    
    public init (title: String, imagePath: String, description: String) {
        self.title = title
        self.imagePath = imagePath
        self.description = description
        
    }
    
    private static func getMoviewData (with completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIKEY)")!)
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
            }
        }.resume()
    }
    
    public static func nowPlaying (with completion: @escaping (_ sucesss: Bool, _ movies: [Movie]?) -> () ) {
        
        Movie.getMoviewData { (success, object) in
            
            print(object)
        }
    }
}
