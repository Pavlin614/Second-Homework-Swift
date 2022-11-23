//
//  SystemPreferencesView.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 19.11.22.
//

import SwiftUI

struct SystemPreferencesView: View {
    @ObservedObject var systemPrefrences : SystemPreferences = SystemPreferences(profile: userProfile,vpn: vpnItem,screenTime: screenTimeItem, general: generalItem, accessibility: accessibilityItem, privacyAndSecurity: privacyAndSecurityItem, passwords: passwordsItem, safari: safariItem, news: newsItem, translate: translateItem, maps: mapsItem, shortcuts: shortcutsItem)
    
    @State var generalItems = [
        SettingsRowView(title: generalItem.text, systemImageName: generalItem.icon,color: .white, backgroundColor: .gray,id: UUID()),
        SettingsRowView(title: accessibilityItem.text, systemImageName: accessibilityItem.icon,color: .white, backgroundColor: .blue,id: UUID()),
        SettingsRowView(title: privacyAndSecurityItem.text, systemImageName: privacyAndSecurityItem.icon,color: .white, backgroundColor: .blue, id: UUID()),
    ]
    
    @State var apps = [
        SettingsRowWithoutSystemIcon(title: safariItem.text, image: safariItem.icon, id: UUID()),
        SettingsRowWithoutSystemIcon(title: newsItem.text, image: newsItem.icon, id: UUID()),
        SettingsRowWithoutSystemIcon(title: translateItem.text, image: translateItem.icon, id: UUID()),
        SettingsRowWithoutSystemIcon(title: mapsItem.text, image: mapsItem.icon, id: UUID()),
        SettingsRowWithoutSystemIcon(title: shortcutsItem.text, image: shortcutsItem.icon, id: UUID())
    ]
    
    var body: some View {
        NavigationView{
            Form {
                Section() {
                    ProfileView(profileIcon: systemPrefrences.profile.icon, buttonText: systemPrefrences.profile.hyperlinkText, messageText: systemPrefrences.profile.messageText)
                    HStack {
                        Image(systemName: systemPrefrences.vpn.icon)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Picker(systemPrefrences.vpn.text, selection: $systemPrefrences.vpnPreviewIndex) {
                            ForEach(SystemPreferences.VpnModes.allCases,id: \.self) {
                                conection in Text(conection.rawValue.capitalized)
                            }
                        }
                    }
                }
                Section(){
                    NavigationLink(destination: EmptyView(), label: {
                        SettingsRowView(title: systemPrefrences.screenTime.text,
                                        systemImageName: systemPrefrences.screenTime.icon,color: .white, backgroundColor: Color(hex: 0x5D3FD3),id: UUID())
                    })
                }
                Section() {
                    ForEach(generalItems, id: \.id) {
                        app in NavigationLink(destination: EmptyView()) {
                            app
                        }
                    }
                }
                Section() {
                    NavigationLink(destination: EmptyView()) {
                        SettingsRowView(title: systemPrefrences.passwords.text, systemImageName: systemPrefrences.passwords.icon,color: .white, backgroundColor: .gray,id: UUID())
                    }
                }
                
                Section() {
                    ForEach(apps, id: \.id) {
                        app in NavigationLink(destination: EmptyView()) {
                            app
                        }
                    }
                }
            }.navigationBarTitle("Settings")
        }
    }
}


struct SystemPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        SystemPreferencesView()
    }
}
