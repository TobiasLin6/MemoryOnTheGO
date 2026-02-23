//
//  NotificationManager.swift
//  MemoryOnTheGO
//
//  Created by Tobias on 2/23/26.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let instance = NotificationManager()
    var appState: AppState?
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            if granted {
                self.scheduleSequence()
            } else if let error = error {
                print("Permission Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func scheduleSequence() {
        let center = UNUserNotificationCenter.current()
        
        if UserDefaults.standard.object(forKey: "FirstOpenTimestamp") == nil {
            let firstOpenDate = Date()
            UserDefaults.standard.set(firstOpenDate, forKey: "FirstOpenTimestamp")
            
            
            let content1 = UNMutableNotificationContent()
            content1.title = "Welcome to MemoryOnTheGO! 🚀"
            content1.body = "The best memory palace techniques at your fingertips. Ready for your first quiz?"
            content1.sound = .default
            
            let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
            let request1 = UNNotificationRequest(identifier: "notif_30s", content: content1, trigger: trigger1)
            
            let content2 = UNMutableNotificationContent()
            content2.title = "Enjoying your experience? 🧠"
            content2.body = "Consistency is the secret to information retention. Keep it up with another pop quiz!"
            content2.sound = .default
            
            let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 90, repeats: false)
            let request2 = UNNotificationRequest(identifier: "notif_90s", content: content2, trigger: trigger2)
            
            let contentDaily = UNMutableNotificationContent()
            contentDaily.title = "Daily Check-in! 📅"
            contentDaily.body = "Time for your daily memory boost. Start a quiz now!"
            contentDaily.sound = .default
            
            let triggerDaily = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)
            let requestDaily = UNNotificationRequest(identifier: "notif_daily", content: contentDaily, trigger: triggerDaily)

            center.add(request1)
            center.add(request2)
            center.add(requestDaily) { error in
                if let error = error {
                    print("Error scheduling: \(error)")
                }
            }
        }
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        DispatchQueue.main.async {
            self.appState?.switchToQuiz()
        }
        
        completionHandler()
    }
}
