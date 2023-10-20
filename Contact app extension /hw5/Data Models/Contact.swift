//
//  Contact.swift
//
//  Created by Hanru Chen on 10/4/23.
//

import Foundation
import UIKit

struct Contact {
    var name: String?
    var email: String?
    var phoneType: String?
    var phone: String?
    var address: String?
    var cityState: String?
    var zipCode: String?
    var image: UIImage?
    
    init(name: String? = nil, email: String? = nil, phoneType: String? = nil, phone: String? = nil, address: String? = nil, cityState: String? = nil, zipCode: String? = nil, image: UIImage? = nil) {
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phone = phone
        self.address = address
        self.cityState = cityState
        self.zipCode = zipCode
        self.image = image
    }
}
