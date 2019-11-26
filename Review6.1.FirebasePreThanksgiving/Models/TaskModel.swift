import Foundation
import FirebaseFirestore

struct Task {
    let title: String
    let body: String
    let id: String
    let creatorID: String
    let dateCreated: Int
    
    init(title: String, body: String, creatorID: String, dateCreated: Int) {
        self.title = title
        self.body = body
        self.creatorID = creatorID
        self.id = UUID().description
        self.dateCreated = dateCreated
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let title = dict["title"] as? String,
            let body = dict["body"] as? String,
            let userID = dict["creatorID"] as? String,
            let dateCreated = dict["dueDate"] as? Int else { return nil }
        
        self.title = title
        self.body = body
        self.creatorID = userID
        self.id = id
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "title": self.title,
            "body": self.body,
            "creatorID": self.creatorID,
            "dueDate": self.dateCreated
        ]
    }
}
