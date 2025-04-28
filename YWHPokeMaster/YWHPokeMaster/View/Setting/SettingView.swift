//
//  SettingView.swift
//  PokeMaster
//
//  Created by Harley-xk on 2019/11/19.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct SettingView: View {

    @EnvironmentObject var store: Store
    var settingsBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    var settings: AppState.Settings {
        store.appState.settings
    }

    var body: some View {
        Form {
            accountSection
            optionSection
            actionsSection
        }
    }

    var accountSection: some View {
        Section(header: Text("账户")) {
            Picker(selection: settingsBinding.accountBehavior, label: Text(""))
            {
                ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self)
                {_ in 
                    Text("dfdfd")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            TextField("电子邮箱", text: settingsBinding.email)
            SecureField("密码", text: settingsBinding.password)
            if settingsBinding.accountBehavier == .register {
                SecureField("确认b密码", text: settingsBinding.verifyPassword)
            }
            Button(settingsBinding.accountBehavier.name) {
                print("登录/注册")
            }
        }
    }

    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: settingsBinding.showEnglishName) { Text("显示英文名") }
            Picker(selection: settingsBinding.sorting, label: Text("排序方式")) {
                ForEach(Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: settingsBinding.showFavoriteOnly) {
                Text("只显示收藏")
            }
        }
    }

    var actionsSection: some View {
        Section {
            Button("清空缓存") {
                print("清空缓存")
            }.foregroundColor(.red)
        }
    }
}

#Preview {
    SettingView()
}
