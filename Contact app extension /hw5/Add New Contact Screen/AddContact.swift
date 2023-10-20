//
//  AddContact.swift
//
//  Created by Hanru Chen on 10/4/23.
//

import UIKit

class AddContact: UIView {

    var labelAddNewContact: UILabel!
    var textFieldName: UITextField!
    var buttonTakePhoto: UIButton!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    var buttonSelectPhoneType: UIButton!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!
    var buttonSave: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLabelAddNewContact()
        setupTextFieldName()
        setupButtonTakePhoto()
        setupTextFieldEmail()
        setupTextFieldPhone()
        setupButtonSelectPhoneType()
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZip()
        setupButtonSave()
        
        initConstraints()
    }
    
    
    func setupLabelAddNewContact() {
        labelAddNewContact = UILabel()
        labelAddNewContact.text = "Add a New Contact"
        labelAddNewContact.font = labelAddNewContact.font.withSize(20)
        labelAddNewContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddNewContact)
    }
    
    func setupTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupButtonTakePhoto() {
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill") , for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    

    func setupTextFieldPhone() {
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "Phone number"
        textFieldPhone.keyboardType = .phonePad
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
    }
    
    func setupButtonSelectPhoneType() {
        buttonSelectPhoneType = UIButton(type: .system)
        buttonSelectPhoneType.setTitle("Home", for: .normal)
        buttonSelectPhoneType.showsMenuAsPrimaryAction = true
        buttonSelectPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectPhoneType)
    }
    
    func setupTextFieldAddress() {
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    
    func setupTextFieldCityState() {
        textFieldCityState = UITextField()
        textFieldCityState.placeholder = "City, State"
        textFieldCityState.borderStyle = .roundedRect
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityState)
    }
    
    func setupTextFieldZip() {
        textFieldZip = UITextField()
        textFieldZip.placeholder = "ZIP"
        textFieldZip.borderStyle = .roundedRect
        textFieldZip.keyboardType = .numberPad
        textFieldZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZip)
    }
    
    func setupButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // 1. labelAddNewContact
            labelAddNewContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelAddNewContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 2. textFieldName
            textFieldName.topAnchor.constraint(equalTo: labelAddNewContact.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            // 3. textFieldEmail
            textFieldEmail.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            // 6. textFieldPhone
            textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhone.trailingAnchor.constraint(lessThanOrEqualTo: buttonSelectPhoneType.leadingAnchor, constant: -8),


            
            buttonSelectPhoneType.centerYAnchor.constraint(equalTo: textFieldPhone.centerYAnchor),
            buttonSelectPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 7. textFieldAddress
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 16),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 8. textFieldCityState
            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 9. textFieldZip
            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 16),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldZip.bottomAnchor, constant: 16),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
