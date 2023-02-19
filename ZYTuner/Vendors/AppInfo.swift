//
//  AppInfo.swift
//  ZYTuner
//
//  Created by joox on 2023/2/16.
//

import Foundation

var AppVersion: String {
    let infoDictionary = Bundle.main.infoDictionary
    let result: String = (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    return result
}

var AppName: String {
    let infoDictionary = Bundle.main.infoDictionary
    let result: String = (infoDictionary?["CFBundleDisplayName"] as? String) ?? ""
    return result
}

var AppBuild: String {
    let infoDictionary = Bundle.main.infoDictionary
    let result: String = (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    return result
}

var AppBunderId: String {
    let infoDictionary = Bundle.main.infoDictionary
    let result: String = (infoDictionary?["CFBundleIdentifier"] as? String) ?? ""
    return result
}

