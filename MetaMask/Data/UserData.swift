//
//  UserData.swift
//  MetaMask
//
//  Created by sheng on 2022/7/30.
//

import Foundation

final class UserData: ObservableObject {
    @Published var user: User = load("user.json")
    @Published var hideWelcome: Bool = UserDefaultsData.restoreFromUserDefaults()
    
    func hideWelcomePage() {
        hideWelcome = true
        UserDefaultsData.storeInUserDefaults()
    }
}

// Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldn't load \(filename) from main bundle.")
    }
    
    do {
       return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

struct UserDefaultsData {
    static let hideWelcomeKey = "HideWelcome"
    static func storeInUserDefaults() {
        UserDefaults.standard.set(true, forKey: hideWelcomeKey)
    }
    
   static func restoreFromUserDefaults() -> Bool {
       UserDefaults.standard.bool(forKey: hideWelcomeKey)
    }
}
