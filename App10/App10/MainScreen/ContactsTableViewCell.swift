//


import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    var contentWrapper: UIScrollView!
    var wrapperCellView: UIView!
    var labelName: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupContentWrapper()
        initConstraints()
    }


    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.isUserInteractionEnabled = false 
        self.contentView.addSubview(contentWrapper)
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            // Constraints for contentWrapper
            contentWrapper.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            // Constraints for wrapperCellView
            wrapperCellView.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -4),
            
            // Constraints for labelName
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor),
            
            // Fixed height for wrapperCellView
            wrapperCellView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
