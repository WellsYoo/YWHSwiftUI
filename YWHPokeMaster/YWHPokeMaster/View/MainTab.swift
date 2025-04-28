//
//  MainTab.swift
//  YWHPokeMaster
//
//  Created by Wells on 2025/4/27.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            PokemonRootView()
                .tabItem {
                    Image(systemName: "list.bullet.below.rectangle")
                    Text("列表")
                }

            SettingRootView().tabItem {
                Image(systemName: "gear")
                Text("设置")
            }

        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    MainTab()
}
