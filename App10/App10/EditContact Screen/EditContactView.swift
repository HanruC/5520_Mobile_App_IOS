import UIKit

class EditContactView: UIView {
    //MARK: Components for editing a Contact...
    var textFieldEditName: UITextField!
    var textFieldEditEmail: UITextField!
    var textFieldEditPhone: UITextField!
    var buttonUpdate: UIButton!
    var contentWrapper: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTextFieldEditName()
        setupTextFieldEditEmail()
        setupTextFieldEditPhone()
        setupButtonUpdate()
        
        initConstraints()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    func setupTextFieldEditName() {
        textFieldEditName = UITextField()
        textFieldEditName.placeholder = "Name"
        textFieldEditName.borderStyle = .roundedRect
        textFieldEditName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEditName)
    }
    
    func setupTextFieldEditEmail() {
        textFieldEditEmail = UITextField()
        textFieldEditEmail.placeholder = "Email"
        textFieldEditEmail.borderStyle = .roundedRect
        textFieldEditEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEditEmail)
    }
    
    func setupTextFieldEditPhone() {
        textFieldEditPhone = UITextField()
        textFieldEditPhone.placeholder = "Phone"
        textFieldEditPhone.borderStyle = .roundedRect
        textFieldEditPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEditPhone)
    }
    
    func setupButtonUpdate() {
        buttonUpdate = UIButton(type: .system)
        buttonUpdate.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonUpdate.setTitle("Update Contact", for: .normal)
        buttonUpdate.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonUpdate)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            textFieldEditName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            textFieldEditName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            
            textFieldEditEmail.topAnchor.constraint(equalTo: textFieldEditName.bottomAnchor, constant: 8),
            textFieldEditEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            textFieldEditPhone.topAnchor.constraint(equalTo: textFieldEditEmail.bottomAnchor, constant: 8),
            textFieldEditPhone.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
 
            
            buttonUpdate.topAnchor.constraint(equalTo: textFieldEditPhone.bottomAnchor, constant: 8),
            buttonUpdate.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonUpdate.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
