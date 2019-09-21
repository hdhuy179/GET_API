//
//  BaseError.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/21/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import Foundation

enum BaseError: Error {
    case networkingError
    case httpError(httpCode: Int)
    case unexpectedError
//    case apiError(error: errorrespo)
    var errorMessage: String? {
        switch self {
        case .networkingError:
            return "Network Error"
        case .httpError(let code)
            return getHttpErrorMessage(httpCode: code)
        }
    }
    
    private func getHttpErrorMessage(httpCode: Int) -> String? {
        if httpCode >= 300 && httpCode <= 308 {
            // Redirection
            return "It was transferred to a different URL. I'm sorry for causing you trouble"
        }
        if httpCode >= 400 && httpCode <= 451 {
            // Client error
            return "An error occurred on the application side. Please try again later!"
        }
        if httpCode >= 500 && httpCode <= 511 {
            // Server error
            return "A server error occurred. Please try again later!"
        }
        // Unofficial error
        return "An error occurred. Please try again later!"
    }
}
