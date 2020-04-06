//
//  AppDelegate.swift
//  daysfromtoday
//
//  Created by Son Nguyen on 2020-04-06.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var ERROR:Int! = -1

    // dayInTheWeek = {MON, TUE, WED, THU, FRI, SAT, SUN}
    func GetDayOfWeek_NDays_InTheFuture(_ dayInTheWeek:String,_  K_days_later :Int)  -> String
    {
        if K_days_later < 0 || K_days_later > 500 {
            return "ERROR"
        }
        let allowable_dates = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        if !allowable_dates.contains( dayInTheWeek.uppercased() ) {
            return "ERROR"
        }
        
        var dayInWeekPositioner = DayInWeek_AsInt(dayInTheWeek)
        var temp_index = K_days_later

        while(temp_index > 0) {
            dayInWeekPositioner = dayInWeekPositioner + 1;
            if (dayInWeekPositioner >= 7) {
                dayInWeekPositioner = 0
            }
            temp_index = temp_index - 1
        }
 
        return DayInWeek_AsString( dayInWeekPositioner )
    }

    func DayInWeek_AsInt(_ DofWeek:String) -> Int
    {
        if( DofWeek.uppercased() == "MON") {return 0}
        else if(DofWeek.uppercased() == "TUE") {return 1}
        else if(DofWeek.uppercased() == "WED") {return 2}
        else if(DofWeek.uppercased() == "THU") {return 3}
        else if(DofWeek.uppercased() == "FRI") {return 4}
        else if(DofWeek.uppercased() == "SAT") {return 5}
        else if(DofWeek.uppercased() == "SUN") {return 6}
        else { return ERROR}
    }

    func DayInWeek_AsString(_ DofWeek: Int) -> String
    {
        if(DofWeek == 0) {return "Mon"}
        else if(DofWeek == 1) {return "Tue"}
        else if(DofWeek == 2) {return "Wed"}
        else if(DofWeek == 3) {return "Thu"}
        else if(DofWeek == 4) {return "Fri"}
        else if(DofWeek == 5) {return "Sat"}
        else if(DofWeek == 6) {return "Sun"}
        else { return "ERROR" }
    }

    func run_test() -> Void {
         var result:String
         result = GetDayOfWeek_NDays_InTheFuture("wed",2)
         NSLog("result(\"wed\",2)=\(result)")
         
        result = GetDayOfWeek_NDays_InTheFuture("sat",23)
         NSLog("result(\"sat\",23)=\(result)")
         
         result = GetDayOfWeek_NDays_InTheFuture("Huh?",55)
         NSLog("result(\"Huh?\",55)=\(result)")
         
         result = GetDayOfWeek_NDays_InTheFuture("sat",0)
          NSLog("result(\"sat\",0)=\(result)")
          
         result = GetDayOfWeek_NDays_InTheFuture("sat",-1)
          NSLog("result(\"sat\",-1)=\(result)")
         
         result = GetDayOfWeek_NDays_InTheFuture("sat",500)
          NSLog("result(\"sat\",500)=\(result)")
         
         result = GetDayOfWeek_NDays_InTheFuture("sat",501)
          NSLog("result(\"sat\",501)=\(result)")
         
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.run_test()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

