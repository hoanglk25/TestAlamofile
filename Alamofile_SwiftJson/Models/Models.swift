//
//  Models.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 08/12/2022.
//

import Foundation
import SwiftyJSON

class ItunesObject {
    var resultCount: Int?
    var results: [Result]?
    
    required init?(json: JSON) {
        self.results = json["results"].arrayValue.map { Result.init(json: $0)! }
        self.resultCount = json["resultCount"].intValue
    }
}

class Result {
    var artistName: String?
    var collectionName: String?
    var previewUrl: String?
    var description: String?
    var artworkUrl100: String?
    
    required init?(json: JSON) {
        self.artistName = json["artistName"].stringValue
        self.collectionName = json["collectionName"].stringValue
        self.previewUrl = json["previewUrl"].stringValue
        self.description = json["description"].stringValue
        self.artworkUrl100 = json["artworkUrl100"].stringValue


    }
}
