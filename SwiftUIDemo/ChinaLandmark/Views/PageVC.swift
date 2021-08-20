//
//  PageVC.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/19.
//

import SwiftUI

//创建UIViewController
struct PageVC : UIViewControllerRepresentable {
    
    let pages:[UIViewController] = featuredLandmarks.map{_ in
        UIHostingController(rootView: Image(systemName: "photo").resizable().scaledToFit())
    }
    //固定用法 用上下文初始化承载类并返回
    func makeCoordinator() -> Coordinator {
        return Coordinator(pages: pages)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        //这里设置代理 上下文返回代理对象
        pageVC.dataSource = context.coordinator
        
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    //创建承载类 用于实现代理方法
    class Coordinator: NSObject,UIPageViewControllerDataSource {
        
        let pages : [UIViewController]
        
        init(pages : [UIViewController]) {
            self.pages = pages
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let currentIndex = pages.firstIndex(of: viewController)!
            return currentIndex == 0 ? pages.last : pages[currentIndex - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let currentIndex = pages.firstIndex(of: viewController)!
            return currentIndex == pages.count-1 ? pages.first : pages[currentIndex + 1]
        }
    }
}

struct PageVC_Previews: PreviewProvider {
    static var previews: some View {
        PageVC()
    }
}
