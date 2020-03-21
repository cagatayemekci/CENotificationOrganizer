//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 21.03.2020.
//

import Foundation
import UserNotifications
public struct NotificationCategory {
    let id: String
    let actions: [UNNotificationAction]
    public init(id: String, actions: [UNNotificationAction]) {
        self.id = id
        self.actions = actions
    }
}
