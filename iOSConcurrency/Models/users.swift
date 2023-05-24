//
//  users.swift
//  iOSConcurrency
//
//  Created by Ebenezer Amoateng Aboagye on 21/05/2023.
//

import Foundation

//Source: https://jsonplaceholder.typicode.com/users

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String

}
