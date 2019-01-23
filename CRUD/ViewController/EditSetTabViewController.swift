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
        editViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: NumberManager.Flag.editTabBarFlg)
        logoutViewController = LogoutViewController()
        logoutViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: NumberManager.Flag.logoutTabBarFlg)
        let myTabs = NSArray(objects: editViewController, logoutViewController)
        setViewControllers(myTabs as? [UIViewController], animated: false)
    }
}
