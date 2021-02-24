//
//  TourInfo.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/05.
//

import Foundation

struct TourInfoRespons: Codable{
    var response: Body?
}

struct Body: Codable{
    var body: Items?
    var head: String?
}

struct Items: Codable{
    var items: Item?
}

struct Item: Codable{
    var item: [TourInfo]?
}


struct TourInfo: Hashable, Codable{
    var galWebImageUrl: URL
    var galPhotographyLocation: String?
    var galTitle: String?
    var galPhotographer: String?
    
    private enum CodingKeys : String, CodingKey {
            case galWebImageUrl, galPhotographyLocation, galTitle, galPhotographer
    }
}

