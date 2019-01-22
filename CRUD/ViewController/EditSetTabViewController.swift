import Foundation
import UIKit

class EditSetTabViewController: UITabBarController {
    private var editViewController: EditViewController!
    private var logoutViewController: LogoutViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension EditSetTabViewController {
    private func setup() {
        editViewController = EditViewController()
        editViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: NumberManager.editTabBarFlg)
        logoutViewController = LogoutViewController()
        logoutViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: NumberManager.logoutTabBarFlg)
        let myTabs = NSArray(objects: editViewController, logoutViewController)
        self.setViewControllers(myTabs as? [UIViewController], animated: false)
    }
}
