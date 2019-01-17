import Foundation
import UIKit

class LogoutViewController: UIViewController {
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: navBar.frame.height)
        navBar.barTintColor = UIColor.white
        let navItem = UINavigationItem()
        navItem.title = R.string.setting.setting()
        navBar.pushItem(navItem, animated: true)
        return navBar
    }()
    
    private lazy var logoutBtn: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        button.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5
        button.setTitle(R.string.setting.logout(), for: .normal)
        button.addTarget(self, action: #selector(goLoginViewController(sender: )), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLogoutButton()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupNavBar()
    }
}

extension LogoutViewController {
    private func setupNavBar() {
        view.addSubview(navBar)
    }
    
    private func setupLogoutButton() {
        view.addSubview(logoutBtn)
        
        logoutBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        logoutBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoutBtn.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
    }
    
    @objc func goLoginViewController(sender: UIButton) {
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
