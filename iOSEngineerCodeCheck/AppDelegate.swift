//
//  AppDelegate.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let store = AppStore(reducer: appReducer, state: AppState(), middleware: [repositoryMiddleware()])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("--- アプリ起動 ---")
        self.openTopPage()
        return true
    }

    // MARK: - UISceneSession Lifecycle
    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("--- Scene呼び出し ---")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("--- アプリ停止 ---")
    }
    */
}
// MARK: - Open TopPage Method
extension AppDelegate {
    private func openTopPage() {
        // 画面設定
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let mainVC = R.storyboard.gitHubRepositorySearchViewController.instantiateInitialViewController() else { return }
        guard let detailVC = R.storyboard.gitHubRepositoryDetailViewController.instantiateInitialViewController() else { return }
        let splitVC = MainSplitViewController(mainVC: mainVC, detailVC: detailVC)
        self.window?.rootViewController = splitVC
        // 画面表示
        self.window?.makeKeyAndVisible()
    }
}
