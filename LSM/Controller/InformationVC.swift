//
//  InformationVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 29/03/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit
import Firebase

class InformationVC: UIViewController {
    
    // Setting up the 1° view in the ScrollView
    lazy var view0:UIView = {
        let view = UIView()
        let title = setUpTitle(title: "Lenguage de Señas Mexicano", font: "Times New Roman")
        let image = setUpImage(image: "0")
        let post = setUpText(doc: "LSM", font: "Times New Roman")
        let seeMore = setUpSeeMore()
        let url = setUpBtnToURL(placeholder: "Lengua de señas mexicana", url: "https://mexicana.cultura.gob.mx/es/repositorio/x2abesp3qm-4")
        
        view.addSubview(title)
        view.addSubview(image)
        view.addSubview(post)
        view.addSubview(seeMore)
        view.addSubview(url)
        title.pinTitleTo(view)
        
        return view
    }()
    
    // Setting up the 2° view in the ScrollView
    lazy var view1:UIView = {
        let view = UIView()
        let title = setUpTitle(title: "La sordera y sus causas", font: "Times New Roman")
        let image = setUpImage(image: "1")
        let post = setUpText(doc: "sordera y causas", font: "Times New Roman")
        let seeMore = setUpSeeMore()
        let url = setUpBtnToURL(placeholder: "Sordera y pérdida de la audición", url: "https://www.who.int/es/news-room/fact-sheets/detail/deafness-and-hearing-loss")
        
        view.addSubview(title)
        view.addSubview(image)
        view.addSubview(post)
        view.addSubview(seeMore)
        view.addSubview(url)
        title.pinTitleTo(view)
        
        return view
    }()
    
    // Setting up the 3° view in the ScrollView
    lazy var view2:UIView = {
        let view = UIView()
        let title = setUpTitle(title: "Inclusión de la gente sorda a la sociedad", font: "Times New Roman")
        let image = setUpImage(image: "2")
        let post = setUpText(doc: "inclusión", font: "Times New Roman")
        let seeMore = setUpSeeMore()
        let url = setUpBtnToURL(placeholder: "Hablar con señas, una inclusión necesaria", url: "https://www.informador.mx/suplementos/Hablar-con-senas-una-forma-de-inclusion-necesaria-20190921-0023.html")
        
        view.addSubview(title)
        view.addSubview(image)
        view.addSubview(post)
        view.addSubview(seeMore)
        view.addSubview(url)
        title.pinTitleTo(view)
        
        return view
    }()
    
    lazy var views = [view0, view1, view2]
    
    // Setting up the Scroll View
    lazy var scrollView:UIScrollView  = {
        let scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        scrollView.delegate = self
        
        return scrollView
    }()
    
    // Setting up the page control
    lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl()
        //pageControl.backgroundColor = .systemGray
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .systemTeal
        pageControl.pageIndicatorTintColor = .systemGray3
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        
        view.addSubview(pageControl)
        pageControl.pinTo(view)
    }
    
    func setUpTitle(title: String, font: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = UIFont(name: font, size: 22)
        
        return label
    }
    
    func setUpImage(image: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.frame = CGRect(x: 67, y: 130, width: 280, height: 150)
        imageView.contentMode = .scaleToFill
        
        return imageView
    }
    
    func setUpText(doc: String, font: String) -> UILabel{
        let label = UILabel()
        
        label.font = UIFont(name: font, size: 17)
        label.textAlignment = .justified
        label.frame = CGRect(x: 20, y: 276, width: 374, height: 441)
        label.numberOfLines = 0
        
        Firestore.firestore().collection("information").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                for document in querySnapshot!.documents {
                    for (key, value) in document.data() {
                        if document.documentID == doc && key == "about" {
                            let labelText = value as? String
                            label.text = labelText?.replacingOccurrences(of: "\\n", with: "\n\n")
                        }
                    }
                }
            }
        }
        return label
    }
 
    func setUpSeeMore() -> UILabel {
        let label = UILabel()
        label.text = "Leer más:"
        label.font = UIFont(name: "Times New Roman", size: 17)
        label.frame = CGRect(x: 20, y: 735, width: 70, height: 34)
        
        return label
    }
    
    func setUpBtnToURL(placeholder: String, url:String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(placeholder, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 16)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.setTitleColor(.link, for: .normal)
        button.frame = CGRect(x: 90, y: 735, width: 305, height: 34)
        
        /*if let myurl = NSURL(string: url){
            UIApplication.shared.open(myurl as URL, options: [:], completionHandler: nil)
            /*if UIApplication.shared.canOpenURL(myurl as URL) {
                UIApplication.shared.open(myurl as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(myurl as URL)
            }*/
        }*/
        return button
    }
    

    
}

extension InformationVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
