//
//  MainSplitViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/29.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class MainSplitViewController: UISplitViewController {
    // デバイスの幅によってdetail部を表示させるかどうかのフラグ
    private var isCollapseSecondary: Bool { self.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .regular)) }
    // MARK: - Lifecycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.setSplitViewController()
    }
}
// MARK: - Private Method
extension MainSplitViewController {
    private func setSplitViewController() {
        guard let mainVC = R.storyboard.gitHubRepositorySearchViewController.instantiateInitialViewController() else { return }
        guard let detailVC = R.storyboard.gitHubRepositoryDetailViewController.instantiateInitialViewController() else { return }
        // 画面表示モードを設定
        self.preferredDisplayMode = .oneBesideSecondary
        // 詳細画面のボタン設定
        detailVC.navigationItem.leftBarButtonItem = .none
        // SplitView登録
        self.viewControllers = [mainVC, detailVC]
    }
}
// MARK: - UISplitViewController Delegate Method
extension MainSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        self.isCollapseSecondary
    }
}
