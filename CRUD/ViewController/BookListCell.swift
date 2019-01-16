import Foundation
import UIKit

class BookListCell: UITableViewCell {
    
    lazy var bookimage: UIImageView = {
        let bookimage = UIImageView()
        bookimage.clipsToBounds = true
        bookimage.layer.borderWidth = 1
        bookimage.layer.borderColor = UIColor.gray.cgColor
        bookimage.translatesAutoresizingMaskIntoConstraints = false
        return bookimage
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var price: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 12)
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    lazy var bookDay: UILabel = {
        let bookDay = UILabel()
        bookDay.font = UIFont.systemFont(ofSize: 12)
        bookDay.translatesAutoresizingMaskIntoConstraints = false
        return bookDay
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        button.setTitle(">", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookListCell {
    private func setupUI() {
        contentView.addSubview(bookimage)
        contentView.addSubview(title)
        contentView.addSubview(price)
        contentView.addSubview(bookDay)
        contentView.addSubview(editButton)
        
        bookimage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20.0).isActive = true
        bookimage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 32.0).isActive = true
        bookimage.widthAnchor.constraint(equalToConstant: 90.0).isActive = true
        bookimage.heightAnchor.constraint(equalToConstant: 65.0).isActive = true
        
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20.0).isActive = true
        title.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: 40.0).isActive = true
        
        price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 35.0).isActive = true
        price.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: 40.0).isActive = true
        
        bookDay.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 70.0).isActive = true
        bookDay.leftAnchor.constraint(equalTo: price.rightAnchor, constant: 40.0).isActive = true
        
        editButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 35.0).isActive = true
        editButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10.0).isActive = true
    }
}
