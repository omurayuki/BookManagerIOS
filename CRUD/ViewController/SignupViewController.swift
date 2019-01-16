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
            emailTextField.text != "",
            passTextField.text != "",
            onemorePassTextField.text != ""
        {
            let emailText = emailTextField.text!
            let passText = passTextField.text!
            let onemorrPassText = onemorePassTextField.text!
            
            if CommonFunction.isValidEmail(emailText) {
            if passText == onemorrPassText {
                let mainTab = MainTabBarController()
                self.present(mainTab, animated: true)
                
                } else {
                    showMessage(messageToDisplay: "パスワードが一致しません。")
                }
            } else {
                showMessage(messageToDisplay: "emailの形式で入力してください。")
            }
            
        } else {
            showMessage(messageToDisplay: "空欄を埋めてください。")
        }
        
    }
}

extension SignupViewController {
    
    public func showMessage(messageToDisplay: String) {
        let alertController = UIAlertController(title: "Alert Title", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "ok", style: .default)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
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
