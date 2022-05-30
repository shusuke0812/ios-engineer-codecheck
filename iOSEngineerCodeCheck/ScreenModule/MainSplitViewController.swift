//
//  MainSplitViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/29.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class MainSplitViewController: UISplitViewController {
    private var isCollapseSecondary: Bool { traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .compact)) }
    private let mainVC: UIViewController
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
        delegate = self
        setSplitViewController()
    }
}

// MARK: - Private Method

extension MainSplitViewController {
    private func setSplitViewController() {
        detailVC.navigationItem.leftBarButtonItem = .none
        viewControllers = [mainVC, detailVC] // split view
    }
}
// MARK: - UISplitViewController Delegate Method
extension MainSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        isCollapseSecondary
    }
}
