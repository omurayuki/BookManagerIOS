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
        editViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        logoutViewController = LogoutViewController()
        logoutViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let myTabs = NSArray(objects: editViewController, logoutViewController)
        self.setViewControllers(myTabs as? [UIViewController], animated: false)
    }
}
