import UIKit

class SignupViewController: UIViewController {

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
            (emailTextField.text?.isEmpty)!,
            (passTextField.text?.isEmpty)!,
            (onemorePassTextField.text?.isEmpty)!
        {
            let emailText = emailTextField.text!
            let passText = passTextField.text!
            let onemorrPassText = onemorePassTextField.text!
            
            if CommonFunction.isValidEmail(emailText) {
            if passText == onemorrPassText {
                let mainTab = MainTabBarController()
                self.present(mainTab, animated: true)
                } else {
                    CommonFunction.showMessage(messageToDisplay: R.string.setting.notMatchPass(), viewController: self)
                }
            } else {
                CommonFunction.showMessage(messageToDisplay: R.string.setting.emailFormatErr(), viewController: self)
            }
        } else {
            CommonFunction.showMessage(messageToDisplay: R.string.setting.emptyErr(), viewController: self)
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
