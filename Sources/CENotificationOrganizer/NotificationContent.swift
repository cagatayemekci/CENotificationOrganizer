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
    public init(id: String, title:String, body: String, sound: UNNotificationSound, badge: Int?, categoryIdentifier: String?, userInfo: [AnyHashable : Any]?) {
        self.id = id
        self.title = title
        self.body = body
        self.sound = sound
        self.badge = badge
        self.categoryIdentifier = categoryIdentifier
        self.userInfo = userInfo
    }
}
