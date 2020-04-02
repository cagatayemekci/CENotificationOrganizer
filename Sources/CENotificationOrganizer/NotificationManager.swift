//
//  File.swift
//  
//
//  Created by Çağatay Emekci on 21.03.2020.
//

import Foundation
import UserNotifications

public enum NotificationType {
    case periodically
    case oneTime
}

public protocol NotificationManagerProtocol {
    func getUserPermission()
    func sendNotification(notificationModel:NotificationModel)
}

public class NotificationManager: NotificationManagerProtocol {
    private let notificationCenter: NotificationCenterProtocol?
    
    public init(notificationCenter: NotificationCenterProtocol = UNUserNotificationCenter.current()) {
        self.notificationCenter = notificationCenter
    }
    
    private func addActionsToNotificationWith(category: NotificationCategory) {
        let nCategory = UNNotificationCategory(identifier: category.id, actions: category.actions, intentIdentifiers: [], options: [])
        notificationCenter?.setNotificationCategories([nCategory])
    }
    
    public func getUserPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter?.requestAuthorization(options: options) { (didAllow, error) in
            if !didAllow {
                print("User has declined notificaiton")
            }
        }
    }
    
    func checkUserPermission(completion: @escaping (UNAuthorizationStatus) -> Void){
        notificationCenter?.getNotificationSettings(completionHandler: { (settings) in
            completion(settings.authorizationStatus)
        })
    }
    private func createNotificationContent(content: NotificationContent) -> UNMutableNotificationContent{
        let nContent = UNMutableNotificationContent()
        nContent.title = content.title
        nContent.body = content.body
        nContent.sound = content.sound
        nContent.badge = content.badge as NSNumber?
        
        if let categoryIdentifier =  content.categoryIdentifier {
            nContent.categoryIdentifier = categoryIdentifier
        }
        
        if let userInfo =  content.userInfo {
            nContent.userInfo = userInfo
        }
        return nContent
    }
    
    public func sendNotification(notificationModel:NotificationModel) {
        if let category = notificationModel.category {
            addActionsToNotificationWith(category: category)
        }
        
        for (index, content) in notificationModel.notificationContent.enumerated() {
            let thisTime:TimeInterval = Double((index + 1)) * notificationModel.minutes * 60
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: thisTime,
                repeats: (notificationModel.type == .periodically))
            
            let request = UNNotificationRequest(identifier: content.id, content: createNotificationContent(content: content), trigger: trigger)
            self.notificationCenter?.add(request) { error in
                if let error = error {
                    print("Error \(error.localizedDescription)")
                }
            }
            
        }
    }
    
}
