//
//  EndPoint.swift
//  TMBDProject
//
//  Created by Jae Oh on 2023/08/16.
//

import Foundation

enum EndPoint {
    case cast
    
    var requestURL: String {
        switch self {
        case .cast: return URL.makeEndPointString("/credits?")
        }
    }
}
