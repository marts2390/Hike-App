//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Chris  Martyr on 05/11/2024.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                LinearGradient(
                    colors: [.customGreyLight, .customGreyMedium],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .opacity(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
            .cornerRadius(40)
    }
}
