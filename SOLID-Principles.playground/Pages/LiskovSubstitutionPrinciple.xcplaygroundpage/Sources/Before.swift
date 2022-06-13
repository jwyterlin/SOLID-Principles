import Foundation

// MARK: Example extracted from: https://betterprogramming.pub/solid-swift-by-examples-part-three-675672c1ec20
//       Thanks Piero Sifuentes!

fileprivate struct User {}

fileprivate protocol UserService {
    func fetchUser(with username: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void)
    func fetchUserPhoto(with username: String, completion: @escaping (_ photo: Data?, _ error: Error?) -> Void)
}

fileprivate class ApiUserService: UserService {
    func fetchUser(with username: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        // HERE MAKE AN API REQUEST AND RETURN USER AND/OR ERROR
        print("API REQUEST HERE")
        let parsedAPIUser = User()
        completion(parsedAPIUser, nil)
    }
  
  
    func fetchUserPhoto(with username: String, completion: @escaping (_ photo: Data?, _ error: Error?) -> Void) {
        print("API REQUEST HERE")
        let downloadedPhotoData = Data()
        completion(downloadedPhotoData, nil)
    }
}

// MARK: What if database doesn't support fetching user's photo?

fileprivate class DatabaseUserService: UserService {
    
    func fetchUser(with username: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        // HERE MAKE A DB REQUEST AND RETURN USER AND/OR ERROR
        print("DB REQUEST HERE")
        let parsedDBUser = User()
        completion(parsedDBUser, nil)
    }
  
    func fetchUserPhoto(with username: String, completion: @escaping (_ photo: Data?, _ error: Error?) -> Void) {
        fatalError("NOT SUPPORTED")
    }
}
