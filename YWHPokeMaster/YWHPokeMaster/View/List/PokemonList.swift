//
//  PokemonList.swift
//  YWHPokeMaster
//
//  Created by Wells on 2025/4/22.
//
import SwiftUI

struct PokemonList: View {
    @State var expandingIndex: Int?
    var body: some View {
        List(PokemonViewModel.all) { pokemon in

            PokemonInfoRow(
                model: pokemon,
                expanded: self.expandingIndex == pokemon.id
            )
            .listRowSeparator(
                .hidden
            )
            .listRowBackground(Color.white)
            .onTapGesture {

                withAnimation(
                    .spring(
                        response: 0.55,
                        dampingFraction: 0.425,
                        blendDuration: 0
                    )
                ) {

                    if self.expandingIndex == pokemon.id {
                        self.expandingIndex = nil
                    } else {
                        self.expandingIndex = pokemon.id
                    }

                }
            }
        }
//        .overlay {
//            VStack {
//                Spacer()
//                PokemonInfoPanel(model: .sample(id: 1))
//            }.edgesIgnoringSafeArea(.bottom)
//        }
    }

}

#Preview {
    PokemonList()
}
