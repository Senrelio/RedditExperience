//
//  StateHub.swift
//  NativeRedditExperience
//
//  Created by iwazaki on 7/12/20.
//

import Foundation
import SwiftUI


class StateHub: ObservableObject {
    @Published private var authState: AuthState = .notYet
    @Published public var subreddits = {
        return [
            Subreddit(id: "1", name: "sub1"),
            Subreddit(id: "2", name: "sub2")
        ]
    }
    @Published var currentSubreddit: Subreddit? = nil
    @Published public var posts = {
        return [
            Post(id: 1, title: "post1", content: "post1post1post1post1post1post1post1post1"),
            Post(id: 2, title: "post2", content: "post2post2post2post2post2post2post2post2")
        ]
    }
    @Published var currentPost: Post? = nil
}
