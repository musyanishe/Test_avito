//
//  Company.swift
//  Test_avito
//
//  Created by Евгения Шевцова on 25.08.2022.
//

import Foundation

struct ResponseCompany: Decodable {
    let company: Company
}

struct Company: Decodable {
    let name: String
    let employees: [Employee]
}

struct Employee: Decodable {
    let name: String
    let phoneNumber: String
    let skills: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case phoneNumber = "phone_number"
        case skills = "skills"
    }
}
