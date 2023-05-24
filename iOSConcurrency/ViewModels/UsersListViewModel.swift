//
//  UsersListViewModel.swift
//  iOSConcurrency
//
//  Created by Ebenezer Amoateng Aboagye on 21/05/2023.
//

import Foundation

class UsersListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    func fetchUsers() {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        isLoading.toggle()
        
        //DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            apiService.getJSON { (result: Result<[User], APIError>) in
                
                defer {
                    DispatchQueue.main.async {
                        self.isLoading.toggle()
                    }
                }
                
                switch result {
                case .success(let users):
                    DispatchQueue.main.async {
                        self.users = users
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showAlert = true
                        self.errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the step to reproduce."
                    }
                }
                
            }
            
            
        //}
        
        
        
    }
}

extension UsersListViewModel {
    convenience init (forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.users = User.mockUsers
        }
    }
}
