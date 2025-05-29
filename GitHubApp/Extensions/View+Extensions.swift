//
//  View+Extensions.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
