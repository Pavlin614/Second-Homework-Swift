//
//  SystemPreferencesView.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 19.11.22.
//

import SwiftUI

private let userProfile = Profile(icon: "person.crop.circle.fill", hyperlinkText: "Sign in to your Iphone", messageText: "Set up iCloud, App Store, and more.")
private let vpnItem = SystemPreferencesItem(icon: "network.badge.shield.half.filled", text: "VPN")
private let screenTimeItem = SystemPreferencesItem(icon: "hourglass", text: "Screen Time")
private let generalItem = SystemPreferencesItem(icon: "gear", text: "General")
private let accessibilityItem = SystemPreferencesItem(icon: "figure.mixed.cardio", text: "Accessibility")
private let privacyAndSecurityItem = SystemPreferencesItem(icon: "hand.raised.fill", text: "Privacy & security")
private let passwordsItem = SystemPreferencesItem(icon: "key.fill", text: "Passwords")
private let safariItem = SystemPreferencesItem(icon: "safari1", text: "Safari")
private let newsItem = SystemPreferencesItem(icon: "news", text: "News")
private let translateItem = SystemPreferencesItem(icon: "translate", text: "Translate")
private let mapsItem = SystemPreferencesItem(icon: "maps", text: "Maps")
private let shortcutsItem = SystemPreferencesItem(icon: "shortcuts", text: "Shortcuts")

struct SystemPreferencesView: View {
    @ObservedObject var systemPrefrences : SystemPreferences = SystemPreferences(profile: userProfile,vpn: vpnItem,screenTime: screenTimeItem, general: generalItem, accessibility: accessibilityItem, privacyAndSecurity: privacyAndSecurityItem, passwords: passwordsItem, safari: safariItem, news: newsItem, translate: translateItem, maps: mapsItem, shortcuts: shortcutsItem)
    
    var body: some View {
        NavigationView{
            Form {
                Section() {
                    HStack{
                        Image(systemName: systemPrefrences.profile.icon)
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        VStack(alignment: .leading, spacing: 2) {
                            Button(systemPrefrences.profile.hyperlinkText) {
                            }
                            Text(systemPrefrences.profile.messageText)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
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
                Section() {
                    NavigationLink(destination: EmptyView(), label: {
                        SettingRowView(title: systemPrefrences.screenTime.text,
                                       systemImageName: systemPrefrences.screenTime.icon,color: .white, backgroundColor: Color(hex: 0x5D3FD3))
                    })
                }
                Section() {
                    NavigationLink(destination: EmptyView()) {
                        SettingRowView(title: systemPrefrences.general.text, systemImageName: systemPrefrences.general.icon,color: .white, backgroundColor: .gray)
                    }
                    NavigationLink(destination: EmptyView()) {
                        SettingRowView(title: systemPrefrences.accessibility.text, systemImageName: systemPrefrences.accessibility.icon,color: .white, backgroundColor: .blue)
                    }
                    NavigationLink(destination: EmptyView()) {
                        SettingRowView(title: systemPrefrences.privacyAndSecurity.text, systemImageName: systemPrefrences.privacyAndSecurity.icon,color: .white, backgroundColor: .blue)
                    }
                }
                Section() {
                    NavigationLink(destination: EmptyView()) {
                        SettingRowView(title: systemPrefrences.passwords.text, systemImageName: systemPrefrences.passwords.icon,color: .white, backgroundColor: .gray)
                    }
                }
                
                Section() {
                    NavigationLink(destination: EmptyView()) {
                        SettingsRowWithoutSystemIcon(title: systemPrefrences.safari.text, image: systemPrefrences.safari.icon)
                    }
                    NavigationLink(destination: EmptyView()) {
                        SettingsRowWithoutSystemIcon(title: systemPrefrences.news.text, image: systemPrefrences.news.icon)
                    }
                    NavigationLink(destination: EmptyView()) {
                        SettingsRowWithoutSystemIcon(title: systemPrefrences.translate.text, image: systemPrefrences.translate.icon)
                    }
                    NavigationLink(destination: EmptyView()) {
                        SettingsRowWithoutSystemIcon(title: systemPrefrences.maps.text, image: systemPrefrences.maps.icon)
                    }
                    NavigationLink(destination: EmptyView()) {
                        SettingsRowWithoutSystemIcon(title: systemPrefrences.shortcuts.text, image: systemPrefrences.shortcuts.icon)
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

struct SettingRowView : View {
    var title : String
    var systemImageName : String
    var color: Color
    var backgroundColor: Color
    
    var body : some View {
        HStack (spacing : 15) {
            Image(systemName: systemImageName)
                .frame(width: 25, height: 25)
                .foregroundColor(color)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text (title)
        }
    }
}

struct SettingsRowWithoutSystemIcon: View {
    var title: String
    var image: String
    
    var body : some View {
        HStack (spacing: 15) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text (title)
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
