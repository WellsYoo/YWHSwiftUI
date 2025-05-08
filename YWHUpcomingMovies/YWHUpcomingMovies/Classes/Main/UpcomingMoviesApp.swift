//
//  UpcomingMoviesApp.swift
//  UpcomingMovies
//
//  Created by Wells on 2025/5/8.
//

import SwiftUI

@main
struct UpcomingMoviesApp: App {

    @State var selectedTab: AppTab = .upcoming
    @State var appRouterPath = RouterPath()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
