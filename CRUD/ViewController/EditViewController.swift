import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.image = R.image.home()
        }
    }
    @IBOutlet weak var bookRegistButton: UIButton!
    @IBOutlet weak var bookNameTextField: UITextField!
    @IBOutlet weak var bookMoneyTextField: UITextField!
    @IBOutlet weak var purchaseDayTextField: UITextField!
    private let dateFormat = DateFormatter()
    private let inputDatePicker = UIDatePicker()
    private var photoLibraryManager: PhotoLibraryManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldDelegate()
        setupUI()
        selectPicker()
        photoLibraryManager = PhotoLibraryManager(parentViewController: self)
    }
    
    @IBAction func bookRegistButtonTapped(_ sender: Any) {
        photoLibraryManager?.callPhotoLibrary()
    }
}

extension EditViewController {
    private func setupUI() {
        bookImage.layer.borderColor = UIColor.gray.cgColor
        bookImage.layer.borderWidth = NumberManager.Size.editBorderWidth
    }
    
    private func selectPicker() {
        let todayDate = Date()
        dateFormat.dateFormat = R.string.setting.format()
        purchaseDayTextField.text = dateFormat.string(from: todayDate as Date)
        inputDatePicker.datePickerMode = .date
        purchaseDayTextField.inputView = inputDatePicker
        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.size.height / NumberManager.Calc.pickerToolBarDivide, width: view.frame.size.width, height: NumberManager.Size.pickerToolBarHeight))
        pickerToolBar.layer.position = CGPoint(x: view.frame.size.width / NumberManager.Calc.pickerToolBarLayerDivide, y: view.frame.size.height - NumberManager.Size.pickerToolBarLayerWidth)
        pickerToolBar.barStyle = .default
        pickerToolBar.tintColor = UIColor.gray
        pickerToolBar.backgroundColor = UIColor.white
        let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let toolBarBtn = UIBarButtonItem(title: R.string.setting.complete(), style: .done, target: self, action: #selector(toolBarBtnPush(_:)))
        pickerToolBar.items = [spaceBarBtn, toolBarBtn]
        purchaseDayTextField.inputAccessoryView = pickerToolBar
        purchaseDayTextField.textColor = UIColor.gray
    }
    
    @objc private func toolBarBtnPush(_ sender: UIBarButtonItem) {
        let pickerDate = inputDatePicker.date
        purchaseDayTextField.text = dateFormat.string(from: pickerDate as Date)
        view.endEditing(true)
    }
}

extension EditViewController: UITextFieldDelegate {
    private func textfieldDelegate() {
        bookNameTextField.delegate = self
        bookMoneyTextField.delegate = self
        purchaseDayTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension EditViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let pickedImage = info[.originalImage] as? UIImage else { return }
        bookImage.image = pickedImage
        picker.dismiss(animated: true)
    }
}
