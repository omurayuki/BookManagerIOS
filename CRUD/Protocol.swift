import Foundation
import UIKit

protocol ViewController {
    func showMessage(message: String)
}

extension ViewController where Self: UIViewController {
    func showMessage(message: String) {
        let alertController = UIAlertController(title: R.string.setting.alertTitle(), message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: R.string.setting.ok(), style: .default)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
    }
}
