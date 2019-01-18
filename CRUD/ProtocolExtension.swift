import Foundation
import UIKit

protocol isValidEmailProtocol {
    func isValidEmail(_ string: String) -> Bool
}

extension isValidEmailProtocol where Self: UIViewController {
    func isValidEmail(_ string: String) -> Bool {
        let rep = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
        let email = string
        let isEmail = NSPredicate(format: "SELF MATCHES %@", rep).evaluate(with: email)
        return isEmail
    }
}

protocol ViewControllerProtocol {
    func showMessage(message: String, viewController: UIViewController)
}

extension ViewControllerProtocol where Self: UIViewController {
    func showMessage(message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: R.string.setting.alertTitle(), message: message, preferredStyle: .alert)

        let OKAction = UIAlertAction(title: R.string.setting.ok(), style: .default)

        alertController.addAction(OKAction)

        viewController.present(alertController, animated: true)
    }
}

protocol AlertProtocol {
    func alertMessage(message: String, viewController: UIViewController, completion: @escaping () -> Void)
}

extension AlertProtocol where Self: UIViewController {
    func alertMessage(message: String, viewController: UIViewController, completion: @escaping () -> Void) {
        let alert: UIAlertController = UIAlertController(title: R.string.setting.display(), message: message, preferredStyle: UIAlertController.Style.actionSheet)
        let defaultAction: UIAlertAction = UIAlertAction(title: R.string.setting.ok(), style: UIAlertAction.Style.default, handler: {
            (_: UIAlertAction!) in
            completion()
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: R.string.setting.cancel(), style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        viewController.present(alert, animated: true)
    }
}

