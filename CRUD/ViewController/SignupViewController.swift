import UIKit

class SignupViewController: UIViewController, ViewControllerProtocol, isValidEmailProtocol {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var onemorePassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldDelegate()
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        if
            !(emailTextField.text?.isEmpty)!,
            !(passTextField.text?.isEmpty)!,
            !(onemorePassTextField.text?.isEmpty)!
        {
            guard let emailText = emailTextField.text else { return }
            guard let passText = passTextField.text else { return }
            guard let onemorrPassText = onemorePassTextField.text else { return }
            
            if isValidEmail(emailText) {
            if passText == onemorrPassText {
                let mainTab = MainTabBarController()
                self.present(mainTab, animated: true)
                } else {
                showAlertMessage(message: R.string.setting.notMatchPass(), viewController: self)
                }
            } else {
                showAlertMessage(message: R.string.setting.emailFormatErr(), viewController: self)
            }
        } else {
            showAlertMessage(message: R.string.setting.emptyErr(), viewController: self)
        }
        
    }
}

extension SignupViewController: UITextFieldDelegate {
    private func textfieldDelegate() {
        emailTextField.delegate = self
        passTextField.delegate = self
        onemorePassTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
