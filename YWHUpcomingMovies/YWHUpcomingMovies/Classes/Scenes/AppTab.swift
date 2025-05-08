//
//  Tabs.swift
//  YWHUpcomingMovies
//
//  Created by Wells on 2025/5/8.
//

import Foundation
import SwiftUI

enum AppTab {
    case upcoming
    case search
    case account

    func makeContentView(selectedTab: Binding<AppTab>) -> some View {
        switch self {
        case .upcoming:
            Text("upcoming")
        case .search:
            Text("search")
        case .account:
            Text("search")
        }

    }
}
