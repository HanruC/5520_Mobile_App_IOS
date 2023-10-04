//
//  DisplayView.swift
//  WA3_Chen_6479
//
//  Created by Hanru Chen on 9/28/23.
//

import UIKit

class DisplayView: UIView {

    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelAddress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    var phoneTypeImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneAndType()
        setupLabelAddress()
        setupLabelCityState()
        setupLabelZip()
        setupPhoneTypeImageView()
        
        initConstraints()
    }
    
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.textAlignment = .left
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPhoneAndType() {
        labelPhone = UILabel()
        labelPhone.textAlignment = .left
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.textAlignment = .left
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelCityState() {
        labelCityState = UILabel()
        labelCityState.textAlignment = .left
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityState)
    }
    
    func setupLabelZip() {
        labelZip = UILabel()
        labelZip.textAlignment = .left
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZip)
    }
    
    func setupPhoneTypeImageView() {
        phoneTypeImageView = UIImageView()
        phoneTypeImageView.contentMode = .scaleAspectFit
        phoneTypeImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneTypeImageView)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelAddress.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelCityState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 16),
            labelCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 16),
            labelZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            phoneTypeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phoneTypeImageView.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 90),
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
