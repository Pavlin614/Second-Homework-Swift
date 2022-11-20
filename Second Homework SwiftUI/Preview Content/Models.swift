//
//  Models.swift
//  Second Homework SwiftUI
//
//  Created by Pavlin Dimitrov on 19.11.22.
//

import Foundation

struct SystemPreferencesItem {
    var icon: String
    var text: String
}

struct Profile {
    var icon: String
    var hyperlinkText: String
    var messageText: String
    
    init(icon: String, hyperlinkText: String, messageText: String) {
        self.icon = icon
        self.hyperlinkText = hyperlinkText
        self.messageText = messageText
    }
}

class SystemPreferences : ObservableObject {
    
    @Published var profile: Profile
    @Published var vpn: SystemPreferencesItem
    @Published var vpnPreviewIndex : VpnModes = .notConnected
    @Published var screenTime: SystemPreferencesItem
    @Published var general: SystemPreferencesItem
    @Published var accessibility: SystemPreferencesItem
    @Published var privacyAndSecurity: SystemPreferencesItem
    @Published var passwords: SystemPreferencesItem
    @Published var safari: SystemPreferencesItem
    @Published var news: SystemPreferencesItem
    @Published var translate: SystemPreferencesItem
    @Published var maps: SystemPreferencesItem
    @Published var shortcuts: SystemPreferencesItem
    
    enum VpnModes : String, CaseIterable{
        case notConnected
        case connected
    }
    
    init(profile: Profile,vpn: SystemPreferencesItem, screenTime: SystemPreferencesItem, general: SystemPreferencesItem, accessibility: SystemPreferencesItem, privacyAndSecurity: SystemPreferencesItem, passwords: SystemPreferencesItem, safari: SystemPreferencesItem, news: SystemPreferencesItem, translate: SystemPreferencesItem, maps: SystemPreferencesItem, shortcuts: SystemPreferencesItem) {
        self.profile = profile
        self.vpn = vpn
        self.screenTime = screenTime
        self.general = general
        self.accessibility = accessibility
        self.privacyAndSecurity = privacyAndSecurity
        self.passwords = passwords
        self.safari = safari
        self.news = news
        self.translate = translate
        self.maps = maps
        self.shortcuts = shortcuts
    }
}


