//
//  AddRepositoryScreen.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import SwiftUI


struct AddRepositoryScreen: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var addRepositoryVM = AddRepositoryViewModel()
   
    var body: some View {
        Form {
            TextField("Name", text: $addRepositoryVM.name)
            TextField("Description", text: $addRepositoryVM.description)
            
            Picker("Select", selection: $addRepositoryVM.visibility, content: {
                Text("Public").tag(GitHubGraphQLAPI.RepositoryVisibility.public)
                Text("Private").tag(GitHubGraphQLAPI.RepositoryVisibility.private)
            }).pickerStyle(SegmentedPickerStyle())
            
            
            HStack {
                Spacer()
                Button("Save") {
                    
                    addRepositoryVM.saveRepository {
                        presentationMode.wrappedValue.dismiss()
                    }
                
                }
                Spacer()
            }
        }
        .navigationTitle("Add Repository")
        .embedInNavigationView()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

struct AddRepositoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddRepositoryScreen()
    }
}
