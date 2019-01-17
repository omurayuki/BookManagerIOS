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
            navBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: 44)
        navBar.barTintColor = UIColor.white
        let navItem = UINavigationItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(bookAdd))
        navItem.rightBarButtonItem = addButton
        navItem.title = R.string.setting.bookList()
        navBar.pushItem(navItem, animated: false)
        return navBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: navBar.frame.size.height + view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.bottom)
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookListCell.self, forCellReuseIdentifier: NSStringFromClass(BookListCell.self))
        return tableView
    }()
    
    private lazy var safeView: UIView = {
        let safeView = UIView()
        safeView.backgroundColor = UIColor.white
        safeView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.safeAreaInsets.top)
        return safeView
    }()
    
    private lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.setting.load(), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(moreLoad(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }
}

extension BookListViewController {
    private func setupUI() {
        view.addSubview(navBar)
        view.addSubview(safeView)
        view.addSubview(tableView)
        view.addSubview(loadButton)
        
        loadButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
        loadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100.0).isActive = true
        loadButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        loadButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    @objc func bookAdd() {
        let bookAddViewController = BookAddViewController()
        self.present(bookAddViewController, animated: true)
    }
    
    @objc func moreLoad(sender: UIButton) {
        print("moreLoad!!")
        //登録書籍情報をさらに読み込む
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: BookListCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(BookListCell.self), for: indexPath) as? BookListCell {
            cell.bookimage.image = R.image.home()
            cell.title.text = "書籍一覧"
            cell.price.text = "200.000円"
            cell.bookDay.text = "2018/12/31"
            cell.editButton.setTitle(">", for: .normal)
            return cell
        }
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //個別の情報を載せて遷移
        let editSetViewController = R.storyboard.main.editSettingTab()!
        self.present(editSetViewController, animated: true)
    }
}
