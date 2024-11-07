//
//  CustomListRowView.swift
//  Hike
//
//  Created by Chris  Martyr on 07/11/2024.
//

import SwiftUI

struct CustomListRowView: View {
    //: MARK - PROPERTIES

    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLabelLink: String? = nil
    @State var rowLinkDestination: String? = nil

    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            } else if rowLabelLink != nil && rowLinkDestination != nil {
                Link(rowLabelLink!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.bold)
                    .font(.subheadline)

            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }

        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }

                Text(rowLabel)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLabelLink: "Credo Academy",
            rowLinkDestination: "https://credo.academy"
        )
    }
}
