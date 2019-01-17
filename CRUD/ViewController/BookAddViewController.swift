import Foundation
import UIKit

class BookAddViewController: UIViewController {
    
    private let todayDate = Date()
    private let dateFormat = DateFormatter()
    private let inputDatePicker = UIDatePicker()
    private var photoLibraryManager: PhotoLibraryManager!
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: self.view.frame.width, height: 44)
        navBar.barTintColor = .white
        let navItem = UINavigationItem()
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBook))
        navItem.rightBarButtonItem = saveButton
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navItem.leftBarButtonItem = cancelButton
        navItem.title = R.string.setting.bookAdd()
        navBar.pushItem(navItem, animated: false)
        return navBar
    }()
    
    private lazy var bookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.home()
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imagePutButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.setting.imageAddButton(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        button.setTitleShadowColor(.white, for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)) as Selector)
        tap.numberOfTapsRequired = 1
        button.addGestureRecognizer(tap)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.setting.bookName()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = R.string.setting.inputText()
        textField.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.setting.money()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = R.string.setting.inputText()
        textField.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var purchaseDayLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.setting.purchaseDay()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var purchaseDayTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = R.string.setting.inputText()
        textField.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        pickerDate()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        photoLibraryManager = PhotoLibraryManager(parentViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }
}

extension BookAddViewController {
    private func setupUI() {
        view.addSubview(navBar)
        
        view.addSubview(bookImage)
        bookImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        bookImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40.0).isActive = true
        bookImage.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 50.0).isActive = true
        
        view.addSubview(imagePutButton)
        imagePutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        imagePutButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        imagePutButton.centerYAnchor.constraint(equalTo: bookImage.centerYAnchor).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 50.0).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40.0).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 18.0).isActive = true
        
        view.addSubview(priceLabel)
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        priceLabel.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: 50.0).isActive = true
        
        view.addSubview(priceTextField)
        priceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        priceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40.0).isActive = true
        priceTextField.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 18.0).isActive = true
        
        view.addSubview(purchaseDayLabel)
        purchaseDayLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        purchaseDayLabel.topAnchor.constraint(equalTo: priceTextField.topAnchor, constant: 50.0).isActive = true
        
        view.addSubview(purchaseDayTextField)
        purchaseDayTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0).isActive = true
        purchaseDayTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40.0).isActive = true
        purchaseDayTextField.topAnchor.constraint(equalTo: purchaseDayLabel.topAnchor, constant: 18.0).isActive = true
    }
    
    @objc func cancel() {
        self.dismiss(animated: true)
    }
    
    @objc func saveBook() {
        print("saveBook")
        //書籍登録ボタン
    }
    
    @objc func toolBarBtnPush(_ sender: UIBarButtonItem) {
        let pickerDate = inputDatePicker.date
        purchaseDayTextField.text = dateFormat.string(from: pickerDate as Date)
        self.view.endEditing(true)
    }
    
    private func pickerDate() {
        dateFormat.dateFormat = R.string.setting.format()
        purchaseDayTextField.text = dateFormat.string(from: todayDate as Date)
        inputDatePicker.datePickerMode = .date
        purchaseDayTextField.inputView = inputDatePicker
        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        pickerToolBar.barStyle = .default
        pickerToolBar.tintColor = .gray
        pickerToolBar.backgroundColor = .white
        let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let toolBarBtn = UIBarButtonItem(title: R.string.setting.complete(), style: .done, target: self, action: #selector(toolBarBtnPush(_:)))
        pickerToolBar.items = [spaceBarBtn, toolBarBtn]
        purchaseDayTextField.inputAccessoryView = pickerToolBar
        purchaseDayTextField.textColor = .gray
    }
    
    @objc func selectPhoto(_ tap: UITapGestureRecognizer) {
        photoLibraryManager.callPhotoLibrary()
    }
    
    private func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObserver() {
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            let transform = CGAffineTransform(translationX: 0, y: -((rect?.size.height)! - 200))
            self.view.transform = transform
        }
    }
    
    @objc func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform.identity
        }
    }
}

extension BookAddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension BookAddViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            bookImage.image = pickedImage
        }
        picker.dismiss(animated: true)
    }
}
