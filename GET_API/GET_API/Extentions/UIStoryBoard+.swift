//
//  UIStoryBoard+.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import UIKit
extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static var repo: UIStoryboard {
        return UIStoryboard(name: "Repo", bundle: nil)
    }
}

extension UIStoryboard {
    static var MainViewController: UIViewController {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            fatalError("MainViewController couldn't be found in Storyboard file")
        }
        return vc
    }
    
    static var RepoViewController: UIViewController {
        guard let vc = UIStoryboard.repo.instantiateViewController(withIdentifier: "RepoViewController") as? RepoViewController else {
            fatalError("RepoViewController couldn't be found in Storyboard file")
        }
        return vc
    }
}
