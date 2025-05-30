//
//  SettingView.swift
//  PokeMaster
//
//  Created by 王 巍 on 2019/09/01.
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
            actionSection
        }
    }

    var accountSection: some View {
        Section(header: Text("账户")) {
            if settings.loginUser == nil {
                Picker(
                    selection: settingsBinding.checker.accountBehavior,
                    label: Text("")
                ) {
                    ForEach(
                        AppState.Settings.AccountBehavior.allCases,
                        id: \.self
                    ) {
                        Text($0.text)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                TextField("电子邮箱", text: settingsBinding.checker.email)
                    .autocorrectionDisabled()
                    .foregroundColor(settings.isEmailValid ? .green : .red)

                SecureField("密码", text: settingsBinding.checker.password)
                    .autocorrectionDisabled()
                if settings.checker.accountBehavior == .register {
                    SecureField(
                        "确认密码",
                        text: settingsBinding.checker.verifyPassword
                    )
                }
                if settings.loginRequesting {
                    Text("登录中...")
                } else {
                    Button(settings.checker.accountBehavior.text) {
                        self.store.dispatch(
                            .login(
                                email: self.settings.checker.email,
                                password: self.settings.checker.password
                            )
                        )
                    }
                }
            } else {
                Text(settings.loginUser!.email)
                Button("注销") {
                    self.store.dispatch(.logout)
                }
            }
        }
    }

    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: settingsBinding.showEnglishName) {
                Text("显示英文名")
            }
            Picker(selection: settingsBinding.sorting, label: Text("排序方式")) {
                ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: settingsBinding.showFavoriteOnly) {
                Text("只显示收藏")
            }
        }
    }

    var actionSection: some View {
        Section {
            Button(action: {
                print("清空缓存")
            }) {
                Text("清空缓存").foregroundColor(.red)
            }
        }
    }
}

extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}

#Preview {
    let store = Store()
    store.appState.settings.sorting = .color
    return SettingView().environmentObject(store)
}
