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
        title.font = .systemFont(ofSize: CGFloat(NumberManager.fontSizeSmall))
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var price: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: CGFloat(NumberManager.fontSizeSmall))
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    lazy var bookDay: UILabel = {
        let bookDay = UILabel()
        bookDay.font = .systemFont(ofSize: CGFloat(NumberManager.fontSizeSmall))
        bookDay.translatesAutoresizingMaskIntoConstraints = false
        return bookDay
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: CGFloat(NumberManager.fontSizeLarge))
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
        bookimage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(NumberManager.bookImageTopConstraint)).isActive = true
        bookimage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: CGFloat(NumberManager.bookImageLeftConstraintInCell)).isActive = true
        bookimage.widthAnchor.constraint(equalToConstant: CGFloat(NumberManager.bookImageWidthConstraintInCell)).isActive = true
        bookimage.heightAnchor.constraint(equalToConstant: CGFloat(NumberManager.bookImageHeightConstraintInCell)).isActive = true
        
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(NumberManager.titleTopConstraint)).isActive = true
        title.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: CGFloat(NumberManager.titleLeftConstraint)).isActive = true
        
        contentView.addSubview(price)
        price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: CGFloat(NumberManager.priceTopConstraint)).isActive = true
        price.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: CGFloat(NumberManager.priceLeftConstraint)).isActive = true
        
        contentView.addSubview(bookDay)
        bookDay.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(NumberManager.bookDayTopConstraint)).isActive = true
        bookDay.leftAnchor.constraint(equalTo: price.rightAnchor, constant: CGFloat(NumberManager.bookDayLeftConstraint)).isActive = true
        
        contentView.addSubview(editButton)
        editButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(NumberManager.editButtonTopConstrain)).isActive = true
        editButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: CGFloat(NumberManager.editButtonRightConstraint)).isActive = true
    }
}
