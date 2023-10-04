//
//  FirstScreenView.swift
//  WA3_Chen_6479
//
//  Created by Hanru Chen on 9/28/23.
//

import UIKit

class FirstScreenView: UIView {

    var labelCreateProfile: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var labelAdd: UILabel!
    var labelSelectType: UILabel!
    var typePicker: UIPickerView!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!
    var buttonShowProfile: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setuplabelCreateProfile()
        setupTextFieldName()
        setupTextFieldEmail()
        setuplabelAdd()
        setuplabelSelectType()
        setupTypePicker()
        setupTextFieldPhone()
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZip()
        setupbuttonShowProfile()
        
        initConstraints()
    }
    //Initializing the UI elements
    func setuplabelCreateProfile() {
        labelCreateProfile = UILabel()
        labelCreateProfile.text = "Create Profile"
        labelCreateProfile.font = labelCreateProfile.font.withSize(20)
        labelCreateProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCreateProfile)
    }
    
    func setupTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setuplabelAdd() {
        labelAdd = UILabel()
        labelAdd.text = "Add Phone"
        labelAdd.font = labelAdd.font.withSize(16)
        labelAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAdd)
    }
    
    func setuplabelSelectType() {
        labelSelectType = UILabel()
        labelSelectType.text = "Select Type:"
        labelSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSelectType)
    }
    
    func setupTypePicker() {
        typePicker = UIPickerView()
        typePicker.isUserInteractionEnabled = true
        typePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(typePicker)
    }
    
    func setupTextFieldPhone() {
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "Phone number"
        textFieldPhone.keyboardType = .phonePad
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
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
    
    func setupbuttonShowProfile() {
        buttonShowProfile = UIButton(type: .system)
        buttonShowProfile.setTitle("Show Profile", for: .normal)
        buttonShowProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonShowProfile)
    }
    
    //Initializing constraints...
    func initConstraints() {
        NSLayoutConstraint.activate([
            // 1. labelCreateProfile
            labelCreateProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelCreateProfile.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 2. textFieldName
            textFieldName.topAnchor.constraint(equalTo: labelCreateProfile.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 3. textFieldEmail
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 4. labelAdd
            labelAdd.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 5. labelSelectType
            labelSelectType.topAnchor.constraint(equalTo: labelAdd.bottomAnchor, constant: 16),
            labelSelectType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 6. typePicker
            typePicker.topAnchor.constraint(equalTo: labelSelectType.bottomAnchor, constant: 16), // Reduced the constant to 8 to bring them closer
            typePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 7. textFieldPhone
            textFieldPhone.topAnchor.constraint(equalTo: typePicker.bottomAnchor, constant: 16),
            textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 8. textFieldAddress
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 16),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 9. textFieldCityState
            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 10. textFieldZip
            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 16),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 11. buttonShowProfile
            buttonShowProfile.topAnchor.constraint(equalTo: textFieldZip.bottomAnchor, constant: 16),
            buttonShowProfile.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
