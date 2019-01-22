import UIKit

class LoginViewController: UIViewController, ViewControllerProtocol, isValidEmailProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldDelegate()
    }
    
    @IBAction func loginBtnTaped(_ sender: Any) {
        //空欄チェック
        guard let emailText = emailTextField.text else { return }
        guard let pass = passTextField.text else { return }
        if !emailText.isEmpty && !pass.isEmpty {
            if isValidEmail(emailText) {
                let mainTab = MainTabBarController()
                self.present(mainTab, animated: true) {
                    self.emailTextField.text = ""
                    self.passTextField.text = ""
                }
            } else {
                showAlertMessage(message: R.string.setting.emailFormatErr(), viewController: self)
            }
        } else {
            showAlertMessage(message: R.string.setting.emptyErr(), viewController: self)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textfieldDelegate() {
        emailTextField.delegate = self
        passTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
