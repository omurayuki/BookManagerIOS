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
}
