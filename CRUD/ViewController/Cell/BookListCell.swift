import Foundation
import UIKit
import Kingfisher

class BookListCell: UITableViewCell {
    
    private lazy var bookimage: UIImageView = {
        let bookimage = UIImageView()
        bookimage.clipsToBounds = true
        bookimage.layer.borderWidth = NumberManager.Size.imageViewBorderWidth
        bookimage.layer.borderColor = UIColor.gray.cgColor
        bookimage.translatesAutoresizingMaskIntoConstraints = false
        return bookimage
    }()
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: NumberManager.Size.fontSizeSmall)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: NumberManager.Size.fontSizeSmall)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    private lazy var bookDay: UILabel = {
        let bookDay = UILabel()
        bookDay.font = .systemFont(ofSize: NumberManager.Size.fontSizeSmall)
        bookDay.translatesAutoresizingMaskIntoConstraints = false
        return bookDay
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: NumberManager.Size.fontSizeLarge)
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
        bookimage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NumberManager.Constraint.bookImageTopConstraint).isActive = true
        bookimage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: NumberManager.Constraint.bookImageLeftConstraintInCell).isActive = true
        bookimage.widthAnchor.constraint(equalToConstant: NumberManager.Constraint.bookImageWidthConstraintInCell).isActive = true
        bookimage.heightAnchor.constraint(equalToConstant: NumberManager.Constraint.bookImageHeightConstraintInCell).isActive = true
        
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NumberManager.Constraint.titleTopConstraint).isActive = true
        title.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: NumberManager.Constraint.titleLeftConstraint).isActive = true
        
        contentView.addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: NumberManager.Constraint.priceTopConstraint).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: bookimage.rightAnchor, constant: NumberManager.Constraint.priceLeftConstraint).isActive = true
        
        contentView.addSubview(bookDay)
        bookDay.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NumberManager.Constraint.bookDayTopConstraint).isActive = true
        bookDay.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: NumberManager.Constraint.bookDayLeftConstraint).isActive = true
        
        contentView.addSubview(editButton)
        editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NumberManager.Constraint.editButtonTopConstrain).isActive = true
        editButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: NumberManager.Constraint.editButtonRightConstraint).isActive = true
    }
    
    func commonInit(name: String, image: String, price: String, purchaseDate: String, editButton: String) {
        self.title.text = name
        self.bookimage.kf.setImage(with: URL(string: image))
        self.priceLabel.text = price
        self.bookDay.text = purchaseDate
        self.editButton.setTitle(editButton, for: .normal)
    }
}
