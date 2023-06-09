//
//  PostsListViewModel.swift
//  iOSConcurrency
//
//  Created by Ebenezer Amoateng Aboagye on 21/05/2023.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var post: [Post] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    var userId: Int?
    
    func fetchPosts() {
        if let userId = userId {
            let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
            
            isLoading.toggle()
            
            apiService.getJSON {(result: Result<[Post], APIError>) in
                
                defer {
                    DispatchQueue.main.async {
                        self.isLoading.toggle()
                    }
                }
                
                
                switch result {
                    case .success(let post):
                        DispatchQueue.main.async {
                        self.post = post
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showAlert = true
                        self.errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the step to reproduce."
                    }
                }
                
            }
            
            
        }
    }
}

extension PostsListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.post = Post.mockSingleUsersPostsArray
        }
    }
    
}
