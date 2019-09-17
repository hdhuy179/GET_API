//
//  ViewController.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    @IBAction func ShowGoogleRepoTapped(_ sender: Any) {
        let repo = UIStoryboard.RepoViewController
        navigationController?.pushViewController(repo, animated: true)
    }
    
}

