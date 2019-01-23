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
        booklistViewController = BookListViewController()
        var navi = UINavigationController(rootViewController: booklistViewController)
            navi.tabBarItem = UITabBarItem(title: R.string.setting.list(), image: nil, tag: NumberManager.Flag.bookListTabBarFlg)
        viewControllers.append(navi)
        logoutViewController = LogoutViewController()
        navi = UINavigationController(rootViewController: logoutViewController)
        navi.tabBarItem = UITabBarItem(title: R.string.setting.setting(), image: nil, tag: NumberManager.Flag.logoutTabBarFlg)
        viewControllers.append(navi)
        setViewControllers(viewControllers, animated: false)
        selectedIndex = 0
    }
}
