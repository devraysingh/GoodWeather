//
//  GoodWeatherApp.swift
//  GoodWeather
//
//  Created by ray on 5/17/23.
//

import SwiftUI

@main
struct GoodWeatherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
