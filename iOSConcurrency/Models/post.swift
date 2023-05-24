//
//  post.swift
//  iOSConcurrency
//
//  Created by Ebenezer Amoateng Aboagye on 21/05/2023.
//

import Foundation

//Source: https://jsonplaceholder.typicode.com/posts

//Single User's Posts: https://jsonplaceholder.typicode.com/users/1/posts


struct Post: Codable,Identifiable {
    
    let userId : Int
    let id : Int
    let title : String
    let body : String
    
}
