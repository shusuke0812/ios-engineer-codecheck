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
    private var isCollapseSecondary: Bool { self.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .compact)) }
    /// MainViewController
    private let mainVC: UIViewController
    /// DetailViewController
    private let detailVC: UIViewController

    init(mainVC: UIViewController, detailVC: UIViewController) {
        self.mainVC = mainVC
        self.detailVC = detailVC
        super.init(nibName: nil, bundle: nil)
        self.preferredDisplayMode = .oneBesideSecondary
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setSplitViewController()
    }
}
// MARK: - Private Method
extension MainSplitViewController {
    private func setSplitViewController() {
        // 詳細画面のボタン設定
        self.detailVC.navigationItem.leftBarButtonItem = .none
        // SplitView登録
        self.viewControllers = [self.mainVC, self.detailVC]
    }
}
// MARK: - UISplitViewController Delegate Method
extension MainSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        self.isCollapseSecondary
    }
}
