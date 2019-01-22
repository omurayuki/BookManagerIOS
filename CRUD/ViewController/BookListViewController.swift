import UIKit
import APIKit

class BookListViewController: UIViewController {
    
    struct BookInfo {
        let bookImage: UIImage?
        let bookTitle: UILabel?
        let bookPrice: UILabel?
        let bookID: UILabel?
    }
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.barTintColor = .white
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private lazy var addButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(bookAdd))
        return addButton
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = CGFloat(NumberManager.tableViewRowHeight)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookListCell.self, forCellReuseIdentifier: NSStringFromClass(BookListCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var safeView: UIView = {
        let safeView = UIView()
        safeView.backgroundColor = .white
        safeView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.safeAreaInsets.top)
        return safeView
    }()
    
    private lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.setting.load(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: CGFloat(NumberManager.fontSizeSmall))
        button.backgroundColor = .blue
        button.layer.cornerRadius = CGFloat(NumberManager.buttonCornerRadiusToCircle)
        button.addTarget(self, action: #selector(moreLoad(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var saveButton: UIBarButtonItem = {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(bookModify))
        return saveButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNavItem()
        setupUI()
    }
}

extension BookListViewController {
    private func setupUI() {
        view.addSubview(safeView)
        view.addSubview(navBar)
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: CGFloat(NumberManager.tableViewTopConstraint)).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: view.frame.height - view.safeAreaInsets.bottom).isActive = true
        view.addSubview(loadButton)
        loadButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat(NumberManager.loadButtonRightConstraint)).isActive = true
        loadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat(NumberManager.loadButtonBottomConstraint)).isActive = true
        loadButton.widthAnchor.constraint(equalToConstant: CGFloat(NumberManager.loadButtonWidthConstraint)).isActive = true
        loadButton.heightAnchor.constraint(equalToConstant: CGFloat(NumberManager.loadButtonHeightConstraint)).isActive = true
    }
    
    func setupNavItem() {
        self.navigationItem.title = R.string.setting.bookList()
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func bookAdd() {
        let bookAddViewController = BookAddViewController()
        self.present(bookAddViewController, animated: true)
    }
    
    @objc private func moreLoad(sender: UIButton) {
        print("moreLoad!!")
        //登録書籍情報をさらに読み込む
    }
    
    //EditViewControllerで発動する
    @objc private func bookModify() {
        print("Modify!!")
        //書籍編集情報保存
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: BookListCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(BookListCell.self), for: indexPath) as? BookListCell {
            cell.bookimage.image = R.image.home()
            //ダミーで適当な値を代入しています
            cell.title.text = "書籍一覧"
            cell.price.text = "200.000円"
            cell.bookDay.text = "2018/12/31"
            cell.editButton.setTitle(R.string.setting.editButton(), for: .normal)
            return cell
        }
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //個別の情報を載せて遷移
        tableView.deselectRow(at: indexPath, animated: true)
        let editSetViewController = R.storyboard.main.editSettingTab()!
        editSetViewController.navigationItem.title = "書籍編集"
        editSetViewController.navigationItem.rightBarButtonItem = saveButton
        self.navigationController?.pushViewController(editSetViewController, animated: true)
    }
}
