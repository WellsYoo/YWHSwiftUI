//
//  Store.swift
//  YWHPokeMaster
//
//  Created by Wells on 2025/4/28.
//
import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
}
