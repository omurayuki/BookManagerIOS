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
}
