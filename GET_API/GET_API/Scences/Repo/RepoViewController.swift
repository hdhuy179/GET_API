//
//  RepoViewController.swift
//  GET_API
//
//  Created by Hoang Dinh Huy on 9/14/19.
//  Copyright © 2019 Hoang Dinh Huy. All rights reserved.
//

import UIKit

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
        let urlPath = "https://api.github.com/users/google/repos"
        guard let url: URL = URL(string: urlPath) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            print("Task Completed")
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard let jsonResult = try? JSONDecoder().decode([Repo].self, from: responseData) else {
                print("Error: error trying to convert data to json")
                return
            }
            DispatchQueue.main.async {
                self.repos = jsonResult
                self.tableView.reloadData()
            }
        }
        task.resume()
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
