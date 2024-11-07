//
//  SettingsView.swift
//  Hike
//
//  Created by Chris  Martyr on 07/11/2024.
//

import SwiftUI

private struct RowItem {
    var rowLabel: String
    var rowIcon: String
    var rowContent: String?
    var rowTintColor: Color
    var rowLabelLink: String?
    var rowLinkDestination: String?
}

struct SettingsView: View {
    // MARK: - PROPERTIES

    @State private var showAlert: Bool = false

    private let alternativeIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire",
    ]

    private let rows: [RowItem] = [
        RowItem(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue),
        RowItem(rowLabel: "Compatability", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red),
        RowItem(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange),
        RowItem(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple),
        RowItem(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink),
        RowItem(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .indigo, rowLabelLink: "Credo Academy", rowLinkDestination: "https://credo.academy"),
    ]

    var body: some View {
        List {
            // MARK: - SECTION HEADER

            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))

                    VStack {
                        Text("Hike").font(.system(size: 66, weight: .black))
                        Text("Editors' Choice").fontWeight(.medium)
                    }

                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(
                    colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .padding(.top, 8)

                VStack(spacing: 8) {
                    Text("Where you can \nperfect tracks")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Text("The hike that looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                        .padding([.top, .bottom], 12)

                    Text("Dust off the boots, it's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenDark)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)

            // MARK: - SECTION ICONS

            Section(header: Text("Alternative Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(alternativeIcons.indices, id: \.self) {
                            item in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternativeIcons[item]) {
                                    error in
                                    if error != nil {
                                        showAlert = true

                                        return
                                    }
                                }

                            } label: {
                                Image("\(alternativeIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                            .padding([.leading], item == 0 ? 20 : 0)
                            .padding([.trailing], item == alternativeIcons.count - 1 ? 20 : 0)
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Oops, something went werong. Please try again")
                                )
                            }
                        }
                    }
                } //: SCROLLVIEW
                .padding(.top, 20)

                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding([.all], 20)
            } //: SECTION
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .black, .clear]), startPoint: .center, endPoint: .trailing))
            .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .black, .clear]), startPoint: .center, endPoint: .leading))

            // MARK: - SECTION ABOUT

            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All rights reserved")
                    Spacer()
                }.padding(.vertical, 8)
            ) {
                // Basic label
                // LabeledContent("Application", value: "Hike")

                // Advanced label
                ForEach(rows, id: \.rowLabel) {
                    item in

                    CustomListRowView(
                        rowLabel: item.rowLabel,
                        rowIcon: item.rowIcon,
                        rowContent: item.rowContent,
                        rowTintColor: item.rowTintColor,
                        rowLabelLink: item.rowLabelLink,
                        rowLinkDestination: item.rowLinkDestination
                    )
                }
            } //: Section
        } //: LIST
    }
}

#Preview {
    SettingsView()
}
