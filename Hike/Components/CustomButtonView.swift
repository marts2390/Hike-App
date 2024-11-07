//
//  CustomButtonView.swift
//  Hike
//
//  Created by Chris  Martyr on 05/11/2024.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.white, .customGreenLight, .customGreenMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                )

            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.customGreyLight, .customGreyMedium],
                        startPoint: .top,
                        endPoint: .bottom),
                    lineWidth: 4)

            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreyLight, .customGreyMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        } //: ZSTACK
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}
