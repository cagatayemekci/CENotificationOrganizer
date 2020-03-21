//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 21.03.2020.
//

import Foundation
import UserNotifications
public struct NotificationContent {
    let id: String
    let title:String
    let body: String
    let sound: UNNotificationSound
    let badge: Int?
    let categoryIdentifier: String?
    let userInfo: [AnyHashable : Any]?
}
