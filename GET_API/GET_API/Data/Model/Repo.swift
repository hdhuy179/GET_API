//
//  Repo.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import ObjectMapper

struct Repo: Decodable {
    var id = 0
    var full_name = ""
//    var owner: Owner = Owner()
    var avatar_url = ""
    var login = ""
    var html_url = ""
    var stargazers_count = 0
    var forks_count = 0
    var watchers = 0
}

extension Repo: Mappable {
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        full_name <- map["full_name"]
        avatar_url <- map["owner.avatar_url"]
        login <- map["owner.login"]
        html_url <- map["html_url"]
        stargazers_count <- map["stargazers_count"]
        forks_count <- map["forks_count"]
        watchers <- map["watchers"]
    }


}
