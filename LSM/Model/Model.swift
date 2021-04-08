//
//  Model.swift
//  LSM
//
//  Created by Ivan Villanueva on 05/04/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class Model {
   
    static func createLessonSection(section collection:String, lesson document: String){
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        
        // Verify the user is authenticated
        if let user = user {
            // if user is signed in...
            let documentReference = db.collection("users").whereField("userId", isEqualTo: user.uid)
            
            documentReference.getDocuments() { (querySnapshot, error) in
                // Check for errors.
                if let error = error {
                    print(error.localizedDescription)
                }
                else if querySnapshot!.documents.count != 1 {
                    print("More than one document or none")
                }
                else { // Get the user's document ID.
                    let doc = querySnapshot!.documents.first
                    let docId = doc?.documentID ?? ""
                    print(docId)
                    
                    /*
                     * Create the collection (Firebase automatically checks if the collection and the document exist)
                     * if the don't, they are created
                     * otherwise the data set in the document gets overriden.
                     *
                     * TODO: Manage the data so it does not get overriden.
                    */
                    db.collection("users/\(docId)/\(collection)").document(document).setData([
                        "pregunta_1": false,
                        "pregunta_2": false,
                        "pregunta_3": false
                    ])
                }
            }
        }
    }
    
    static func updateLessonAnswers(question:String, answer:Int) {
        
    }
}
