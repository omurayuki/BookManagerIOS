import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    private var booklistViewController: BookListViewController!
    private var logoutViewController: LogoutViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MainTabBarController {
    private func setup() {
        var viewControllers: [UIViewController] = []
        do {
            booklistViewController = BookListViewController()
            let navi = UINavigationController(rootViewController: booklistViewController)
                navi.tabBarItem = UITabBarItem(title: R.string.setting.list(), image: nil, tag: NumberManager.bookListTabBarFlg)
            viewControllers.append(navi)
        }
        do {
            logoutViewController = LogoutViewController()
            let navi = UINavigationController(rootViewController: logoutViewController)
            navi.tabBarItem = UITabBarItem(title: R.string.setting.setting(), image: nil, tag: 2)
            viewControllers.append(navi)
        }
        self.setViewControllers(viewControllers, animated: false)
        self.selectedIndex = 0
    }
}
