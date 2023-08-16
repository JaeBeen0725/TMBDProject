//
//  TMDBURL.swift
//  TMBDProject
//
//  Created by Jae Oh on 2023/08/15.
//

import Foundation

extension URL {
    
    static let baseURL = "https://api.themoviedb.org/3/"
    
    static func makeEndPointString(_ endpoint: String) -> String {
        return baseURL + endpoint + "api_key=\(Key.tmdb)"
    }
    
}
