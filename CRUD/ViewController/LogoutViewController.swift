import Foundation
import UIKit

class LogoutViewController: UIViewController, AlertProtocol {
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.barTintColor = .white
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private lazy var logoutBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = CGFloat(NumberManager.buttonCornerRadius)
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
        setupNavItem()
    }
}

extension LogoutViewController {
    private func setupNavItem() {
        self.navigationItem.title = R.string.setting.setting()
    }
    
    private func setupLogoutButton() {
        view.addSubview(logoutBtn)
        logoutBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        logoutBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoutBtn.widthAnchor.constraint(equalToConstant: CGFloat(NumberManager.logoutButtonWidthConstraint)).isActive = true
    }
    
    @objc private func goLoginViewController(sender: UIButton) {
        alertMessage(message: R.string.setting.wannaLogout(), viewController: self) {
            let loginViewController = R.storyboard.main.loginNavi()!
            self.present(loginViewController, animated: true)
        }
    }
}
