//
//  CardView.swift
//  Hike
//
//  Created by Chris  Martyr on 05/11/2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var image: String = "image-1"
    @State private var index: Int = 0
    @State private var isShowingSheet: Bool = false
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    let images: [String] = [
        "image-1",
        "image-2",
        "image-3",
        "image-4",
        "image-5",
    ]
   
    // MARK: - FUNCTIONS
    
    func getImage() {
        image = images[index]

        index = index == 4 ? 0 : index + 1
    }
    
    var body: some View {
        // MARK: - CARD

        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 53))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGreyLight, .customGreyMedium],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        CustomButtonView()
                    }
                    
                    Text("Fun and enjoyable activity for friends and families.")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/ .leading/*@END_MENU_TOKEN@*/)
                        .italic()
                        .foregroundColor(.customGreyMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - CONTENT

                ZStack {
                    CustomCircleView()
                    
                    AnimatedImageView(imageName: image).onReceive(timer, perform: { _ in
                        getImage()
                    })
                } //: ZSTACK
                
                // MARK: - FOOTER
                
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("View more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: /*@START_MENU_TOKEN@*/ .black/*@END_MENU_TOKEN@*/ .opacity(0.25), radius: 0.25, x: 1, y: 1
                        )
                }
                .buttonStyle(GradientButton())
                .sheet(isPresented: $isShowingSheet) {
                    SettingsView()
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.medium, .large])
                }
            } //: VSTACK
        } //: CARD
        .frame(width: 350, height: 570)
    }
}

#Preview {
    CardView()
}
