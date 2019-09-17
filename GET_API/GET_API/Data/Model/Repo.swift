//
//  Repo.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import ObjectMapper

struct Repo {
    var id = 0
    var fullname = ""
    var avatarURLString = ""
    var ownerName = ""
    var urlString = ""
    var stargazersCount = 0
    var forksCount = 0
    var watchers = 0
}

extension Repo: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        fullname <- map["full_name"]
        avatarURLString <- map["owner.avatar_url"]
        ownerName <- map["owner.login"]
        urlString <- map["html_url"]
        stargazersCount <- map["stargazers_count"]
        forksCount <- map["forks_count"]
        watchers <- map["watchers"]
    }
    
    
}
