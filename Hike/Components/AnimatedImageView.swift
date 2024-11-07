//
//  AnimatedImageView.swift
//  Hike
//
//  Created by Chris  Martyr on 06/11/2024.
//

import SwiftUI

struct AnimatedImageView: View {
    var imageName: String

    @State private var displayedImageName: String = ""
    @State private var imageOffsetX: CGFloat = 0
    @State private var opacity: Double = 0

    private func slideIn() {
        imageOffsetX = UIScreen.main.bounds.width

        withAnimation(.easeIn(duration: 0.15)) {
            opacity = 1
        }

        withAnimation(.easeOut(duration: 0.25)) {
            imageOffsetX = 0
        }
    }

    private func slideOutAndChangeImage(newImageName: String) {
        // Slide out to the right
        withAnimation(.easeIn(duration: 0.15)) {
            opacity = 0
        }

        withAnimation(.easeIn(duration: 0.25)) {
            imageOffsetX = -UIScreen.main.bounds.width
        }

        // After the animation ends, update the displayed image and slide it back in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            displayedImageName = newImageName // Update image only after slide-out completes
            slideIn()
        }
    }

    init(imageName: String) {
        self.imageName = imageName

        _displayedImageName = State(initialValue: imageName)
    }

    var body: some View {
        Image(displayedImageName)
            .resizable()
            .scaledToFit()
            .offset(x: imageOffsetX)
            .opacity(opacity)
            .onAppear {
                slideIn()
            }
            .onChange(of: imageName) {
                slideOutAndChangeImage(newImageName: imageName)
            }
    }
}

#Preview {
    AnimatedImageView(imageName: "image-1")
}
