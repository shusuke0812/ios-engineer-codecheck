//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositorySearchViewController: UIViewController {

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
// MARK: - UISearchBar Delegate Method
extension GitHubRepositorySearchViewController: UISearchBarDelegate {
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
}
// MARK: - UITableVIew Delegate Method
extension GitHubRepositorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.transitionGitHubRepositoryDetail()
    }
}
