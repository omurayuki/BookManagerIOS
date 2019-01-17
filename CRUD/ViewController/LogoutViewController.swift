import Foundation
import UIKit

class LogoutViewController: UIViewController {
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.barTintColor = .white
        navBar.pushItem(navItem, animated: true)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private lazy var navItem: UINavigationItem = {
        let navItem = UINavigationItem()
        navItem.title = R.string.setting.setting()
        return navItem
    }()
    
    private lazy var logoutBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = CGFloat(numberManager.buttonCornerRadius)
        button.setTitle(R.string.setting.logout(), for: .normal)
        button.addTarget(self, action: #selector(goLoginViewController(sender: )), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLogoutButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNavBar()
    }
}

extension LogoutViewController {
    private func setupNavBar() {
        view.addSubview(navBar)
        navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        navBar.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: navBar.frame.height).isActive = true
    }
    
    private func setupLogoutButton() {
        view.addSubview(logoutBtn)
        logoutBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        logoutBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoutBtn.widthAnchor.constraint(equalToConstant: CGFloat(numberManager.logoutButtonWidthConstraint)).isActive = true
    }
    
    @objc private func goLoginViewController(sender: UIButton) {
        let alert: UIAlertController = UIAlertController(title: R.string.setting.display(), message: R.string.setting.wannaLogout(), preferredStyle: UIAlertController.Style.actionSheet)
        let defaultAction: UIAlertAction = UIAlertAction(title: R.string.setting.ok(), style: UIAlertAction.Style.default, handler: {
            (_: UIAlertAction!) in
            let loginViewController = R.storyboard.main.loginNavi()!
                self.present(loginViewController, animated: true)
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: R.string.setting.cancel(), style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            self.present(alert, animated: true)
    }
}
