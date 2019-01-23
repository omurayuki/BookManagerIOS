import UIKit

class LoginViewController: UIViewController, ViewControllerProtocol, EmailValidable {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldDelegate()
    }
    
    @IBAction func loginBtnTaped(_ sender: Any) {
        guard let emailText = emailTextField.text else { return }
        guard let pass = passTextField.text else { return }
        guard !emailText.isEmpty && !pass.isEmpty else {
            return showAlertMessage(message: R.string.setting.emailFormatErr(), viewController: self)
        }
        guard isValidEmail(emailText) else {
            return showAlertMessage(message: R.string.setting.emptyErr(), viewController: self)
        }
        let mainTab = MainTabBarController()
        self.present(mainTab, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textfieldDelegate() {
        emailTextField.delegate = self
        passTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
