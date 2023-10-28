import UIKit

class ContactDetailsView: UIView {
    
    var detailCardView: UIView!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var phoneLabel: UILabel!
    var editButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupDetailCardView()
        setupNameLabel()
        setupEmailLabel()
        setupPhoneLabel()
        setupEditButton()
        initConstraints()
    }
    
    func setupEditButton() {
        editButton = UIButton(type: .system)
        editButton.setTitle("Edit", for: .normal)
        editButton.backgroundColor = UIColor.systemBlue
        editButton.setTitleColor(.white, for: .normal)
        editButton.layer.cornerRadius = 5
        editButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(editButton)
    }
    
    //MARK: Make the display screen in card view design other
    //MARK: than the normal screen.
    func setupDetailCardView(){
        detailCardView = UIView()
        detailCardView.backgroundColor = .white
        detailCardView.layer.cornerRadius = 6
        detailCardView.layer.shadowColor = UIColor.lightGray.cgColor
        detailCardView.layer.shadowOffset = .zero
        detailCardView.layer.shadowRadius = 4.0
        detailCardView.layer.shadowOpacity = 0.7
        detailCardView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(detailCardView)
    }
    
    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailCardView.addSubview(nameLabel)
    }
    
    func setupEmailLabel() {
        emailLabel = UILabel()
        emailLabel.font = .systemFont(ofSize: 14)
        emailLabel.textColor = .gray
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailCardView.addSubview(emailLabel)
    }
    
    func setupPhoneLabel() {
        phoneLabel = UILabel()
        phoneLabel.font = .systemFont(ofSize: 14)
        phoneLabel.textColor = .gray
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        detailCardView.addSubview(phoneLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            detailCardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            detailCardView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            detailCardView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            nameLabel.topAnchor.constraint(equalTo: detailCardView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: detailCardView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: detailCardView.trailingAnchor, constant: -16),

            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            phoneLabel.bottomAnchor.constraint(equalTo: detailCardView.bottomAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: detailCardView.bottomAnchor, constant: 10),
            editButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            editButton.widthAnchor.constraint(equalTo: detailCardView.widthAnchor, multiplier: 0.5),
            editButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
