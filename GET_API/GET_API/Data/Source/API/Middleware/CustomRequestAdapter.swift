//
//  RequestAdapter.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/20/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import Alamofire

final class CustomRequestAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}

