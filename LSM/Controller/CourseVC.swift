//
//  CourseVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 17/02/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit
import Firebase


class CourseVC: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
     * SECCIÓN 1 ---> INTRODUCCIÓN A LSM
    */
    
    @IBAction func alphabetLesson(_ sender: Any) {
        Model.createLessonSection(section:"Introducción a LSM", lesson:"Alfabeto")
        
        let vc = self.storyboard?.instantiateViewController(identifier: "TemplateOneVC") as! TemplateOneVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func courtesyLesson(_ sender: Any) {
        Model.createLessonSection(section:"Introducción a LSM", lesson:"Cortesía")
    }
    
    
    /*
     * SECCIÓN 2 ---> INFORMACIÓN PERSONAL
    */
    
    
    
    /*
     * SECCIÓN 3 ---> COMUNIDAD SEÑATE
    */
    
    
    
    /*
     * SECCIÓN 4 ---> ME COMUNICO EN LSM
    */

}
