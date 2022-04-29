//
//  DatabaseManager.swift
//  Cave
//
//  Created by 유민규 on 2022/04/26.
//

import FirebaseDatabase

// Firebase Database 설정 파일
public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: = Public
    
    /// Check if username and email is available
    /// - Parameters
    ///     - email: String representing
    ///     - username: String representing username
    public func canCreateNerUser(with email: String, username: String, comlection: (Bool) -> Void) {
        comlection(true)
    }
    
    ///  Insert new user data to database
    /// - Parameters
    ///     - email: String representing
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succeded 
    public func insertNewUser(with email: String, username: String, complection: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        print(key)
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                complection(true)
                return
            }
            else {
                // failed
                complection(false)
                return
            }
        }
    }

}
