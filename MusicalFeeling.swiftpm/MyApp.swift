import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.colorScheme, .light)
        }
    }
}
