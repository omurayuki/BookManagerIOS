import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    private var booklistViewController: BookListViewController!
    private var logoutViewController: LogoutViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}

extension MainTabBarController {
    private func setTabBar() {
        booklistViewController = BookListViewController()
        booklistViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: numberManager.bookListTabBarFlg)
        booklistViewController.tabBarItem = UITabBarItem(title: R.string.setting.list(), image: nil, tag: numberManager.bookListTabBarFlg)
        logoutViewController = LogoutViewController()
        logoutViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: numberManager.logoutTabBarFlg)
        logoutViewController.tabBarItem = UITabBarItem(title: R.string.setting.setting(), image: nil, tag: numberManager.logoutTabBarFlg)
        let myTabs = NSArray(objects: booklistViewController, logoutViewController)
        self.setViewControllers(myTabs as? [UIViewController], animated: false)
    }
}
