import Foundation
import UIKit

class CommonFunction: UIViewController {
    static let common: CommonFunction = CommonFunction()
    
    static public func isValidEmail(_ string: String) -> Bool {
        let rep = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
        let email = string
        let isEmail = NSPredicate(format: "SELF MATCHES %@", rep).evaluate(with: email)
        return isEmail
    }
    
    static public func showMessage(messageToDisplay: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: R.string.setting.alertTitle(), message: messageToDisplay, preferredStyle: .alert)

        let OKAction = UIAlertAction(title: R.string.setting.ok(), style: .default)

        alertController.addAction(OKAction)

        viewController.present(alertController, animated: true)
    }
    
    static public func alertMessage(messageToDisplay: String, viewController: UIViewController, completion: @escaping () -> Void) {
        let alert: UIAlertController = UIAlertController(title: R.string.setting.display(), message: messageToDisplay, preferredStyle: UIAlertController.Style.actionSheet)
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
