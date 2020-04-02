//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 2.04.2020.
//

import UserNotifications

public protocol NotificationCenterProtocol {
    func setNotificationCategories(_ categories: Set<UNNotificationCategory>)
    func requestAuthorization(options: UNAuthorizationOptions, completionHandler: @escaping (Bool, Error?) -> Void)
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?)
    func getNotificationSettings(completionHandler: @escaping (UNNotificationSettings) -> Void)
}

extension UNUserNotificationCenter: NotificationCenterProtocol {}
