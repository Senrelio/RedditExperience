//
//  NativeRedditExperienceApp.swift
//  NativeRedditExperience
//
//  Created by iwazaki on 7/10/20.
//

import SwiftUI

@main
struct NativeRedditExperienceApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @ObservedObject var stateHub: StateHub = StateHub()
    @Environment(\.openURL) private var openURL
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Link("signin", destination: AuthHelper.getAuthUrl(for: .Normal)) 
//                SubredditList(subreddits: stateHub.subreddits())
//                PostList(posts: stateHub.posts())
//                PostView(post: stateHub.currentPost)
                //                ContentView()
            }
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func application(_ application: NSApplication, open urls: [URL]) {
        if let url = urls.first {
            redirectHandler(url: url)
        }
    }
}

public func redirectHandler(url: URL) {
    let urlParsed = URLComponents.init(url: url, resolvingAgainstBaseURL: true)
    let queries: [URLQueryItem] = urlParsed?.queryItems ?? [URLQueryItem]()
    let queryDict: [String:String] = queries.reduce([:], { a, b in
        var result: [String:String] = a
        result[b.name] = b.value
        return result
    })
    let keys = queryDict.keys
    if keys.contains("state") && keys.contains("code") { // MARK: this is for OAuth2
        AuthHelper.retrieveAccessToken(usingCode: queryDict["code"]!)
    }
}
