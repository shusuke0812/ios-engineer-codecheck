//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositorySearchViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var SchBr: UISearchBar!
    
    var repo: [[String: Any]] = []
    var task: URLSessionTask?
    var word: String!
    var url: String!
    var idx: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SchBr.text = "GitHubのリポジトリを検索できるよー"
        SchBr.delegate = self
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        word = searchBar.text!
        if word.count != 0 {
            // TODO: APIをコールするメソッドを追加
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let rp = repo[indexPath.row]
        cell.textLabel?.text = rp["full_name"] as? String ?? ""
        cell.detailTextLabel?.text = rp["language"] as? String ?? ""
        cell.tag = indexPath.row
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.transitionGitHubRepositoryDetail()
    }
}
// MARK: - Private Method
extension GitHubRepositorySearchViewController {
    // GitHubRepository詳細ページへ遷移
    private func transitionGitHubRepositoryDetail() {
        let s = UIStoryboard(name: "GitHubRepositoryDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! GitHubRpositoryDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
