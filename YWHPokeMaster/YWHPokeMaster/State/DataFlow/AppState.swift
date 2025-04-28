//
//  AppState.swift
//  YWHPokeMaster
//
//  Created by Wells on 2025/4/28.
//

import Combine

struct AppState {
    var settings = Settings()

}

extension AppState {
    struct Settings {

        enum Sorting {
            case id, name, color, favorite
        }

        enum AccountBehavior: CaseIterable {
            case register, login
        }

        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""

        var showEnglishName = true
        var sorting = Sorting.id
        var showFavoriteOnly = false

        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        //
        var loginRequesting = false
        var loginError: AppError?
    }
}
