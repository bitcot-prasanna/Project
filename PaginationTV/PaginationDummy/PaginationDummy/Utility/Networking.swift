//
//  ForeCastVC.swift
//  Weather-App
//
//  Created by admin on 04/05/22.
//

import Foundation
import Alamofire

let url : String = "https://api.instantwebtools.net/v1/passenger"
/*
 param need to pass:
 1. page=0  -- pages started from 0 to 10994(total: 10995)
 2. size=10 -- size can give of any number as per requirement
*/

typealias AirlineResponse = ((_ data : Foundation.Data? , _ error : Error?)->Void)


class Networking {
    static let shared = Networking()
    func getData(parameter : Parameters , completionHandler : @escaping AirlineResponse){
        AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil).response { response in
            completionHandler(response.data , response.error)
        }
    }
}
