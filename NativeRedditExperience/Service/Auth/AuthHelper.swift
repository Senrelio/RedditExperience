//
//  AuthHelper.swift
//  NativeRedditExperience
//
//  Created by iwazaki on 7/13/20.
//

import Foundation

// MARK: edit function group
let dummyFunctions = ["identity", "edit", "read", "mysubreddits"].joined(separator: " ")

typealias AccessToken = String

struct AuthHelper {
    static let baseAuthUrl = "https://www.reddit.com/api/v1/authorize"
    static let clientId = "_ldub2r1jEr0PQ"
    static let response_type = "code"
    static let state: String = "fromExperience"
    static let redirectUri = "red://auth_response".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    static let duration = "temporary"
    static let scope: String = dummyFunctions.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
    static let grantType = "authorization_code"
    static let basicAuthPassword = " "
    static let basicAuthValue = "Basic \("\(clientId):\(basicAuthPassword)".data(using: .utf8)!.base64EncodedString())"
    
    static let scopes = ["identity", "edit", "flair", "history", "modconfig", "modflair", "modlog", "modposts", "modwiki", "mysubreddits", "privatemessages", "read", "report", "save", "submit", "subscribe", "vote", "wikiedit", "wikiread"]
    
    enum Function: String {
        case dentity, edit, flair, history, modconfig, modflair, modlog, modposts, modwiki, mysubreddits, privatemessages, read, report, save, submit, subscribe, vote, wikiedit, wikiread
    }
    
    
    enum AuthType {
        case Normal
    }
    
    static func getAuthUrl(for authType: AuthType) -> URL {
        switch authType {
            case .Normal:
                return URL(string: "\(baseAuthUrl)?client_id=\(clientId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)&response_type=\(response_type)&state=\(state)&redirect_uri=\(redirectUri)&duration=\(duration)&scope=\(scope)")!
        }
    }
    
    static func retrieveAccessToken(usingCode code: String) -> AccessToken {
        let bodyQuery = "grant_type=\(AuthHelper.grantType)&code=\(code)&redirect_uri=\(AuthHelper.redirectUri)"
        let url = URL(string: "https://www.reddit.com/api/v1/access_token?"+bodyQuery)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(AuthHelper.basicAuthValue, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                print("error", error ?? "unknown error")
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString ?? "wrong response")")
        }
        task.resume()
        return "" // MARK: change returns of retrieve acccess token methods
    }
}

