//
//  APIService.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/19/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import Alamofire
import ObjectMapper
//typealias JSONDictionary = [String: Any]
class  APIService {
    
    static let shared = APIService()
    
    private var alamofireManager = Alamofire.SessionManager.default
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        let alamofireManager = Alamofire.SessionManager(configuration: configuration)
        alamofireManager.adapter = CustomRequestAdapter()
    }
    
    func request(input: BaseRequest, completion: @escaping (_ value: [[String: Any]]?, _ error: Error?) -> Void) {
        
        alamofireManager.request(input.url,
                                 method: input.requestType,
                                 parameters: input.parameters,
                                 encoding: input.encoding)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let statusCode = response.response?.statusCode {
                        if statusCode == 200 {
                            print("[\(statusCode)] " + input.url)
//                            completion(value as? [String : Any], nil)
                            let list = value as? Array<[String: Any]>
                            completion(list, nil)
                        }
                        else {
                            print("[\(statusCode)] " + input.url)
                            
                        }
                    }
                    
                case .failure(let error): break
                    
                }
        }
        
//        AF.request(urlPath).responseJSON(queue: DispatchQueue.main, options: JSONSerialization.ReadingOptions(), completionHandler: { response in
//            switch response.result {
//            case .success(let value):
//                if let statusCode = response.response?.statusCode {
//                    if statusCode == 200 {
//                        print("[\(statusCode)] " + urlPath)
//                        let objects = value as! Array<Any>
//                        for item in objects {
//                            if let item = item as? [String: Any],
//                                let repo = Repo(JSON: item) {
//                                print(repo)
////                                self.repos.append(repo)
//                            }
//                        }
////                        self.tableView.reloadData()
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        } )
        
    }
}
