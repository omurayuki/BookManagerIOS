import Foundation
import UIKit

class BookListCell: UITableViewCell {
    
    let numberManager = NumberManager()
    
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
        title.font = .systemFont(ofSize: CGFloat(numberManager.systemFontSize(size: 12)))
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var price: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: CGFloat(numberManager.systemFontSize(size: 12)))
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    lazy var bookDay: UILabel = {
        let bookDay = UILabel()
        bookDay.font = .systemFont(ofSize: CGFloat(numberManager.systemFontSize(size: 12)))
        bookDay.translatesAutoresizingMaskIntoConstraints = false
        return bookDay
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: CGFloat(numberManager.systemFontSize(size: 18)))
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
        bookimage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(numberManager.bookImageTopConstraint)).isActive = true
        bookimage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: CGFloat(numberManager.bookImageLeftConstraintInCell)).isActive = true
        bookimage.widthAnchor.constraint(equalToConstant: CGFloat(numberManager.bookImageWidthConstraintInCell)).isActive = true
        bookimage.heightAnchor.constraint(equalToConstant: CGFloat(numberManager.bookImageHeightConstraintInCell)).isActive = true
        
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(numberManager.titleTopConstraint)).isActive = true
        title.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: CGFloat(numberManager.titleLeftConstraint)).isActive = true
        
        contentView.addSubview(price)
        price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: CGFloat(numberManager.priceTopConstraint)).isActive = true
        price.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: CGFloat(numberManager.priceLeftConstraint)).isActive = true
        
        contentView.addSubview(bookDay)
        bookDay.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(numberManager.bookDayTopConstraint)).isActive = true
        bookDay.leftAnchor.constraint(equalTo: price.rightAnchor, constant: CGFloat(numberManager.bookDayLeftConstraint)).isActive = true
        
        contentView.addSubview(editButton)
        editButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(numberManager.editButtonTopConstrain)).isActive = true
        editButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: CGFloat(numberManager.editButtonRightConstraint)).isActive = true
    }
}
