//
//  PostListView.swift
//  iOSConcurrency
//
//  Created by Ebenezer Amoateng Aboagye on 21/05/2023.
//

import SwiftUI

struct PostListView: View {
    
    // MARK:- PROPERTIES
    @StateObject var vm = PostsListViewModel(forPreview: false)
    var userId: Int?
    
    var body: some View {
        List {
            ForEach(vm.post) { post in
                
                
                
                VStack (alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
            }
        }
        .overlay(content: {
            if vm.isLoading {
                ProgressView()
            }
        })
        .alert("Application Error", isPresented: $vm.showAlert, actions: {
            Button("OK"){}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
        })
        .navigationBarTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
        .onAppear {
            vm.userId = userId
            vm.fetchPosts()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(userId: 1)
        }
    }
}
