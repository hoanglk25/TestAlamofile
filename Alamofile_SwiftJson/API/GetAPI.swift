//
//  GetAPI.swift
//  Alamofile_SwiftJson
//
//  Created by Hoàng Đức on 08/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

func getItunes(text searchText: String, _ onSucssess: @escaping (([Result]?) -> Void), _ onFailure: @escaping ((String) -> Void)) {
    
    let url = String(format: "https://itunes.apple.com/search?term=A&limit=5", searchText)
    guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
          let urlResquest = URL(string: urlString) else { return}
    
    // Request
    AF.request(urlResquest, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in
        switch response.result {
        case .success(let value):
            if let value = value, let data = ItunesObject(json: JSON(value)) {
                if data.resultCount ?? 0 > 0 {
                    onSucssess(data.results)
                } else {
                    onFailure("Results is emty")
                }
            } else {
                onFailure("Results not found")
            }
            
            break
            
        case .failure(let error):
            onFailure(error.localizedDescription)
            break
        }
    }
}
