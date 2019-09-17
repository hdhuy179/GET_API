//
//  RepoTableViewCell.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import UIKit

final class RepoTableViewCell: UITableViewCell {

    @IBOutlet private weak var RepoNameLabel: UILabel!
    @IBOutlet private weak var RepoOwnerLabel: UILabel!
    
    func blind(repo: Repo) {
        backgroundColor = .lightGray
        RepoNameLabel.text = repo.fullname
        RepoOwnerLabel.text = repo.ownerName
    }
    
    
}
