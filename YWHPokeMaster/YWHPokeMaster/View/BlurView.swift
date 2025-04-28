//
//  BlurView.swift
//  YWHPokeMaster
//
//  Created by Wells on 2025/4/23.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    let style: UIBlurEffect.Style

    init(style: UIBlurEffect.Style) {
        print("init")
        self.style = style
    }

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {

        print("Make UIView")

        let blureEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blureEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }

    func updateUIView(
        _ uiView: UIView,
        context: UIViewRepresentableContext<BlurView>
    ) {
        print("Update UIView")

        if let blurView = uiView as? UIVisualEffectView {
            let blureEffect = UIBlurEffect(style: style)
            blurView.effect = blureEffect
        }
    }
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}

#Preview {
    BlurView(style: .systemMaterialDark)
}
