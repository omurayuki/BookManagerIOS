import Foundation
import UIKit
import Kingfisher

class BookListCell: UITableViewCell {
    
    private lazy var bookimage: UIImageView = {
        let bookimage = UIImageView()
        bookimage.clipsToBounds = true
        bookimage.layer.borderWidth = 1
        bookimage.layer.borderColor = UIColor.gray.cgColor
        bookimage.translatesAutoresizingMaskIntoConstraints = false
        return bookimage
    }()
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: NumberManager.fontSizeSmall)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var price: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: NumberManager.fontSizeSmall)
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    private lazy var bookDay: UILabel = {
        let bookDay = UILabel()
        bookDay.font = .systemFont(ofSize: NumberManager.fontSizeSmall)
        bookDay.translatesAutoresizingMaskIntoConstraints = false
        return bookDay
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: NumberManager.fontSizeLarge)
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
        bookimage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: NumberManager.bookImageTopConstraint).isActive = true
        bookimage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: NumberManager.bookImageLeftConstraintInCell).isActive = true
        bookimage.widthAnchor.constraint(equalToConstant: NumberManager.bookImageWidthConstraintInCell).isActive = true
        bookimage.heightAnchor.constraint(equalToConstant: NumberManager.bookImageHeightConstraintInCell).isActive = true
        
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: NumberManager.titleTopConstraint).isActive = true
        title.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: NumberManager.titleLeftConstraint).isActive = true
        
        contentView.addSubview(price)
        price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: NumberManager.priceTopConstraint).isActive = true
        price.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: NumberManager.priceLeftConstraint).isActive = true
        
        contentView.addSubview(bookDay)
        bookDay.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: NumberManager.bookDayTopConstraint).isActive = true
        bookDay.leftAnchor.constraint(equalTo: price.rightAnchor, constant: NumberManager.bookDayLeftConstraint).isActive = true
        
        contentView.addSubview(editButton)
        editButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: NumberManager.editButtonTopConstrain).isActive = true
        editButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: NumberManager.editButtonRightConstraint).isActive = true
    }
    
    func commonInit(name: String, image: String, price: String, purchaseDate: String, editButton: String) {
        self.title.text = name
        self.bookimage.kf.setImage(with: URL(string: image))
        self.price.text = price
        self.bookDay.text = purchaseDate
        self.editButton.setTitle(editButton, for: .normal)
    }
}
