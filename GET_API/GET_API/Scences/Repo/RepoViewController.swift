//
//  RepoViewController.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import UIKit
import Alamofire

final class RepoViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var repos:[Repo] = []
    
    private let cellID = "cellID"
    
    private let rowHeight: CGFloat = 65
    
    override func viewWillAppear(_ animated: Bool) {
        getAPIData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = rowHeight
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    
    private func getAPIData() {
        let request = BaseRequest(url: Urls.getGoogleRepoList)
        
        APIService.shared.request(input: request) { (values, error) in
            if let error = error {
                print(error)
            } else if let values = values {
                for value in values {
                    if let repo = Repo(JSON: value) {
                        self.repos.append(repo)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
}

extension RepoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RepoTableViewCell
        cell.blind(repo: repos[indexPath.item])
        return cell
    }
}

extension RepoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
