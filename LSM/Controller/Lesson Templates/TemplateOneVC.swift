//
//  TemplateOneVC.swift
//  LSM
//
//  Created by Ivan Villanueva on 04/04/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//

import UIKit

class TemplateOneVC: UIViewController {
    lazy var view0:UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemTeal
        
        return view
    }()
    
    lazy var view1:UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemPink
        
        return view
    }()
    lazy var view2:UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemIndigo
        
        return view
    }()
    
    lazy var views = [view0, view1, view2]
    
    lazy var scrollView:UIScrollView  = {
        let scrollView = UIScrollView()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
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
    
   
    
}

extension TemplateOneVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
    }
}
