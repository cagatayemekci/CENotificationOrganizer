//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 21.03.2020.
//

import Foundation

public struct NotificationModel {
    let notificationContent: [NotificationContent]
    let category: NotificationCategory?
    let type: NotificationType
    let minutes: Double
}
