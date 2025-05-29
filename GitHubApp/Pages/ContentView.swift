//
//  ContentView.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @StateObject private var repositoryListVM = RepositoryListViewModel()
    @State private var usernameInput: String = "jouniverse" // Default username
    
    // NEW: Local state for Picker selection, initialized from ViewModel's default
    @State private var localPickerSelection: RepositoriesDisplay
    
    // Initializer to sync localPickerSelection with ViewModel's default
    init() {
        _localPickerSelection = State(initialValue: RepositoryListViewModel().repositoriesDisplay)
    }
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Enter GitHub Username", text: $usernameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                Button("Fetch") {
                    fetchRepositories()
                }
                // Color of the fetch button
                // .foregroundColor(.red)
            }
            .padding(.bottom)
            
            // Picker now binds to the local @State variable
            Picker("Select", selection: $localPickerSelection, content: {
                Text("Latest").tag(RepositoriesDisplay.latest)
                Text("Top").tag(RepositoriesDisplay.top)
            }).pickerStyle(SegmentedPickerStyle())
            
            
            List(repositoryListVM.respositories, id: \.id) { repository in
                NavigationLink(destination: RepoDetailView(repository: repository, owner: usernameInput)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(repository.name)
                                .font(.headline)
                                .foregroundColor(.blue.opacity(0.9)) // Changed to blue for visibility
                            Text(repository.description)
                        }
                        Spacer()
                        
                        if repository.hasRating {
                            HStack {
                                Text("\(repository.starCount)")
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                        
                    }
                }
            }.listStyle(PlainListStyle())
                .cornerRadius(10)
        }
        .padding()
        .onAppear(perform: {
            // Initial fetch. localPickerSelection should already be synced via init.
            // Ensure ViewModel is also in sync if it could have changed elsewhere (though unlikely for this property)
            repositoryListVM.repositoriesDisplay = localPickerSelection
            fetchRepositories()
        })
        // onChange now observes the local @State variable
        .onChange(of: localPickerSelection) { newValue in
            print(".onChange of localPickerSelection detected new display value: \(newValue)")
            // Update the ViewModel's state
            repositoryListVM.repositoriesDisplay = newValue
            // Fetch repositories based on the new state
            fetchRepositories()
        }
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $isPresented, onDismiss: {
            // Fetch repositories using the current usernameInput when the sheet is dismissed
            fetchRepositories(forDismissal: true)
        }, content: {
            AddRepositoryScreen()
        })
        .navigationTitle("Repositories")
        .embedInNavigationView()
        
    }

    
    private func fetchRepositories(forDismissal: Bool = false) {
        // Do not fetch if username is empty, unless it's after adding a repo (forDismissal = true)
        // and we want to refresh with the potentially last valid username.
        if usernameInput.isEmpty && !forDismissal {
            // Optionally clear the list or show a message
            repositoryListVM.respositories = []
            return
        }
        
        let userToFetch = usernameInput.isEmpty && forDismissal ? Constants.User.username : usernameInput
        if userToFetch.isEmpty { // Final check if userToFetch is still empty
             repositoryListVM.respositories = []
             return
        }

        print("Fetching for display type: \(repositoryListVM.repositoriesDisplay)") // Diagnostic print

        switch repositoryListVM.repositoriesDisplay {
            case .latest:
                print("Calling getLatestRepositoriesForUser for \(userToFetch)") // Diagnostic print
                repositoryListVM.getLatestRepositoriesForUser(username: userToFetch)
            case .top:
                print("Calling getTopRepositoriesForUser for \(userToFetch)") // Diagnostic print
                repositoryListVM.getTopRepositoriesForUser(username: userToFetch)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
