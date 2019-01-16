import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldDelegate()
    }
    
    @IBAction func loginBtnTaped(_ sender: Any) {
        //空欄チェック
        if emailTextField.text != "" && passTextField.text != "" {
            let emailText = emailTextField.text
            let pass = passTextField.text
            //バリデーションチェック passはキーボードを英数字ものにする
            if CommonFunction.isValidEmail(emailText!) {
                let mainTab = MainTabBarController()
                self.present(mainTab, animated: true) {
                    self.emailTextField.text = ""
                    self.passTextField.text = ""
                }
            } else {
                showMessage(messageToDisplay: "emailの形式で入力してください。")
            }
        } else {
            showMessage(messageToDisplay: "空欄を埋めてください。")
        }
    }
}

extension LoginViewController {
    public func showMessage(messageToDisplay: String) {
        let alertController = UIAlertController(title: "Alert Title", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "ok", style: .default)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
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
