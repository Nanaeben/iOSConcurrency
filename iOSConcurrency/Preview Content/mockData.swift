//
//  mockData.swift
//  iOSConcurrency
//
//  Created by Ebenezer Amoateng Aboagye on 21/05/2023.
//

import Foundation

extension User {
    static var mockUsers: [User] {
        Bundle.main.decode([User].self, from: "users.json")
    }
    
    static var mockSingleUser: User {
        Self.mockUsers[0]
    }
}



extension Post {
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "post.json")
    }
    
    static var mockSinglePost: Post {
        Self.mockPosts[0]
    }
    
    static var mockSingleUsersPostsArray: [Post] {
        Self.mockPosts.filter{ $0.userId == 1}
    }
}
