//
//  TemplateOneVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 04/04/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

class TemplateOneVC: UIViewController {
    
    let generalL:GeneralLayout = GeneralLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
    }
    
    /*
     * DEFINITIONS OF THE VIEWS
     */
    lazy var view0:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra C?")
        
        layout(view: view, progressBar: "Progress bar pt1")
        
        answers(view:view, image:"A1", X:20, Y:243, WH:160, answer:"A", lblX:79, lblY:411, lblWH:40)
        answers(view:view, image:"B", X:217, Y:243, WH:160, answer:"B", lblX:277, lblY:411, lblWH:40)
        answers(view:view, image:"C1", X:20, Y:470, WH: 160, answer:"C", lblX:79, lblY:638, lblWH:40)
        answers(view:view, image:"D1", X:217, Y:470, WH:160, answer:"D", lblX:277, lblY:638, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var view1:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra E?")
        
        layout(view: view, progressBar: "Progress bar pt2")
        
        answers(view:view, image:"E", X:20, Y:243, WH:160, answer:"E", lblX:79, lblY:411, lblWH:40)
        answers(view:view, image:"F", X:217, Y:243, WH:160, answer:"F", lblX:277, lblY:411, lblWH:40)
        answers(view:view, image:"G1", X:20, Y:470, WH: 160, answer:"G", lblX:79, lblY:638, lblWH:40)
        answers(view:view, image:"H", X:217, Y:470, WH:160, answer:"H", lblX:277, lblY:638, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var view2:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra J?")
       
        layout(view: view, progressBar: "Progress bar pt3")
        
        answers(view:view, image:"I", X:20, Y:243, WH:160, answer:"I", lblX:79, lblY:411, lblWH:40)
        answers(view:view, image:"J", X:217, Y:243, WH:160, answer:"J", lblX:277, lblY:411, lblWH:40)
        answers(view:view, image:"K", X:20, Y:470, WH: 160, answer:"K", lblX:79, lblY:638, lblWH:40)
        answers(view:view, image:"L", X:217, Y:470, WH:160, answer:"L", lblX:277, lblY:638, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var view3:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra Ñ?")
        
        layout(view: view, progressBar: "Progress bar pt4")
        
        answers(view:view, image:"LL", X:20, Y:243, WH:160, answer:"LL", lblX:79, lblY:411, lblWH:40)
        answers(view:view, image:"M", X:217, Y:243, WH:160, answer:"M", lblX:277, lblY:411, lblWH:40)
        answers(view:view, image:"N1", X:20, Y:470, WH: 160, answer:"N", lblX:79, lblY:638, lblWH:40)
        answers(view:view, image:"nie", X:217, Y:470, WH:160, answer:"Ñ", lblX:277, lblY:638, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var view4:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra Q?")
        
        layout(view: view, progressBar: "Progress bar pt5")
        
        answers(view:view, image:"O1", X:20, Y:243, WH:160, answer:"O", lblX:79, lblY:411, lblWH:40)
        answers(view:view, image:"P", X:217, Y:243, WH:160, answer:"P", lblX:277, lblY:411, lblWH:40)
        answers(view:view, image:"Q", X:20, Y:470, WH: 160, answer:"Q", lblX:79, lblY:638, lblWH:40)
        answers(view:view, image:"R1", X:217, Y:470, WH:160, answer:"R", lblX:277, lblY:638, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var view5:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra RR?")
        
        layout(view: view, progressBar: "Progress bar pt6")
        
        answers(view:view, image:"RR", X:20, Y:243, WH:160, answer:"RR", lblX:79, lblY:411, lblWH:40)
        answers(view:view, image:"S", X:217, Y:243, WH:160, answer:"S", lblX:277, lblY:411, lblWH:40)
        answers(view:view, image:"T", X:20, Y:470, WH: 160, answer:"T", lblX:79, lblY:638, lblWH:40)
        answers(view:view, image:"U", X:217, Y:470, WH:160, answer:"U", lblX:277, lblY:638, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var view6:UIView = {
        let view = UIView()
        let question = generalL.questionLabel(question: "¿Qué seña representa la letra X?")
        
        layout(view: view, progressBar: "Progress bar pt7")
        
        answers(view:view, image:"V", X:29, Y:210, WH:140, answer:"V", lblX:79, lblY:358, lblWH:40)
        answers(view:view, image:"W", X:226, Y:210, WH:140, answer:"W", lblX:286, lblY:358, lblWH:40)
        answers(view:view, image:"X", X:29, Y:405, WH: 140, answer:"X", lblX:79, lblY:553, lblWH:40)
        answers(view:view, image:"Y", X:226, Y:405, WH:140, answer:"Y", lblX:286, lblY:553, lblWH:40)
        answers(view:view, image:"Z", X:137, Y:596, WH:140, answer:"Z", lblX:187, lblY:744, lblWH:40)
        
        view.addSubview(question)
        
        return view
    }()
    
    lazy var views = [view0, view1, view2, view3, view4, view5, view6]
    
    lazy var scrollView:UIScrollView  = {
        let scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl()
        
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
    
    /*
     * VIEWS LAYOUT
     */
    // Creation of the X button for closing a lesson
    func cancelLesson() -> UIButton {
        let cancelBtn: UIButton = UIButton()
        
        cancelBtn.setImage(UIImage(named: "cancel-lesson"), for: .normal)
        cancelBtn.frame = CGRect(x: 20, y: 59, width: 28, height: 28)
        cancelBtn.addTarget(self, action: #selector(cancelLessonAction), for: .touchUpInside)
        
        return cancelBtn
    }
    
    // Giving an action to the X button.
    @objc
    func cancelLessonAction() {
        let alert = UIAlertController(title: "¿Seguro quieres salir?", message: "Tu progeso de esta lección se perderá", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Salir", style: .destructive, handler: {(_: UIAlertAction) in
            
            let vc = self.storyboard?.instantiateViewController(identifier: "CourseVC") as! CourseVC
             
             self.navigationController?.pushViewController(vc, animated: false)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func progrssBar(whichImage: String) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.frame = CGRect(x: 84, y: 55, width: 246, height: 34)
        imageView.image = UIImage(named: whichImage)
        
        return imageView
    }
    
    func nextButton() -> UIButton {
        let nextBtn: UIButton = UIButton()
        
        nextBtn.setTitle("Siguiente", for: .normal)
        nextBtn.backgroundColor = .systemGreen
        nextBtn.titleLabel?.font = UIFont(name: "Arial", size: 18)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nextBtn.frame = CGRect(x: 279, y: 800, width: 115, height: 35)
        nextBtn.layer.cornerRadius = 18
        nextBtn.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
        return nextBtn
    }
    
    // Creating and action for the NEXT button.
    @objc
    func nextButtonAction() {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        
        pageControl.currentPage = Int(pageIndex)
        scrollView.scrollTo(horizontalPage: pageControl.currentPage+1, verticalPage: 0, animated: false)
    }
    
    /*
     * View's Main Layout
     */
    func layout(view:UIView, progressBar image:String) {
        let closeLesson = cancelLesson()
        let progessBar = progrssBar(whichImage: image)
        let next = nextButton()
        
        view.addSubview(closeLesson)
        view.addSubview(progessBar)
        view.addSubview(next)
    }
    
    /*
     * USER'S ANSWERS
     */
    func answers(view:UIView, image:String, X:Int, Y:Int, WH:Int, answer:String, lblX:Int, lblY:Int, lblWH:Int) {
        let image = generalL.answerImage(whichImage:image, x:X, y:Y, width:WH, height:WH )
        let btn = generalL.answerButton(x:X, y:Y, width:WH, height:WH)
        let lbl = generalL.answerLabel(answer: answer, x:lblX, y: lblY, width: lblWH, height: lblWH)
        
        view.addSubview(image)
        view.addSubview(btn)
        view.addSubview(lbl)
    }
}

/*
 * EXTENSIONS
 */
extension TemplateOneVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        
        pageControl.currentPage = Int(pageIndex)
    }
}

