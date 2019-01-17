import Foundation
import UIKit

class EditSetTabViewController: UITabBarController {
    private var editViewController: EditViewController!
    private var logoutViewController: LogoutViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}

extension EditSetTabViewController {
    private func setTabBar() {
        editViewController = EditViewController()
        editViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: numberManager.editTabBarFlg)
        logoutViewController = LogoutViewController()
        logoutViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: numberManager.logoutTabBarFlg)
        let myTabs = NSArray(objects: editViewController, logoutViewController)
        self.setViewControllers(myTabs as? [UIViewController], animated: false)
    }
}
