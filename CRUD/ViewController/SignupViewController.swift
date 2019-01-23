import UIKit

class SignupViewController: UIViewController, ViewControllerProtocol, EmailValidable {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var onemorePassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldDelegate()
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        guard
            !(emailTextField.text?.isEmpty)!,
            !(passTextField.text?.isEmpty)!,
            !(onemorePassTextField.text?.isEmpty)!
            else
        {
            return showAlertMessage(message: R.string.setting.emptyErr(), viewController: self)
        }
        guard let emailText = emailTextField.text else { return }
        guard let passText = passTextField.text else { return }
        guard let onemorrPassText = onemorePassTextField.text else { return }
            
        guard isValidEmail(emailText) else {
            return showAlertMessage(message: R.string.setting.emailFormatErr(), viewController: self)
        }
        guard passText == onemorrPassText else {
            return showAlertMessage(message: R.string.setting.notMatchPass(), viewController: self)
        }
        let mainTab = MainTabBarController()
        self.present(mainTab, animated: true)
    }
}

extension SignupViewController: UITextFieldDelegate {
    private func textfieldDelegate() {
        emailTextField.delegate = self
        passTextField.delegate = self
        onemorePassTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
