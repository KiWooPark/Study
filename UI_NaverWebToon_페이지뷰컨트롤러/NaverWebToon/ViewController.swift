//
//  ViewController.swift
//  NaverWebToon
//
//  Created by PKW on 2023/02/14.
//

import UIKit


struct Page {
    var vc = UIViewController()
    init(vc: UIViewController) {
        self.vc = vc
    }
}

struct PageArray {
    var pages = [Page]()
    var selectedPageIndex = 0
}

class ViewController: UIViewController {
    
    @IBOutlet var pageViewControllerBaseView: UIView!
    
    @IBOutlet var bannerView: UIView!
    
//    private lazy var underlineView: UIView = {
//        let width = self.view.frame.width / 10
//        let height = 5.0
//        let yPostion = bannerView.frame.height + 55
//        let frame = CGRect(x: 10, y: yPostion, width: width, height: height)
//        let view = UIView(frame: frame)
//        view.restorationIdentifier = "underlineView"
//        view.backgroundColor = .black
//        return view
//    }()
    
    var pageViewController = UIPageViewController()
    //var pageArray = PageArray()
    
    var pageArray = [UIViewController]()
    private var selectedPageIndex = 0
    
    private var estimateOffSetX: CGFloat = 0
    
    var categoryList = ["신작","월","화","수","목","금","토","일","매일+","완결"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configPageViewController()
        //self.view.addSubview(underlineView)
        
      
    }


    // 페이지 뷰 컨트롤러 생성
    func configPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        // 델리게이트, 데이터소스 연결
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        if let vc0 = self.storyboard?.instantiateViewController(withIdentifier: "0") as? VC0ViewController {
            
            let page0 = Page(vc: vc0)
//            pageArray.pages.append(page0)
            pageArray.append(vc0)
        }
        
        if let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "1") as? VC1ViewController {
            
            let page1 = Page(vc: vc1)
//            pageArray.pages.append(page1)
            pageArray.append(vc1)
        }
        
        if let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "2") as? VC2ViewController {
            
            let page2 = Page(vc: vc2)
//            pageArray.pages.append(page2)
            pageArray.append(vc2)
        }
        
        if let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "3") as? VC3ViewController {
            
            let page3 = Page(vc: vc3)
//            pageArray.pages.append(page3)
            pageArray.append(vc3)
        }
        
        if let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "4") as? VC4ViewController {
            
            let page4 = Page(vc: vc4)
//            pageArray.pages.append(page4)
            pageArray.append(vc4)
        }
        
        if let vc5 = self.storyboard?.instantiateViewController(withIdentifier: "5") as? VC5ViewController {
            
            let page5 = Page(vc: vc5)
//            pageArray.pages.append(page5)
            pageArray.append(vc5)
        }
        
        if let vc6 = self.storyboard?.instantiateViewController(withIdentifier: "6") as? VC6ViewController {
            
            let page6 = Page(vc: vc6)
//            pageArray.pages.append(page6)
            pageArray.append(vc6)
        }
        
        if let vc7 = self.storyboard?.instantiateViewController(withIdentifier: "7") as? VC7ViewController {
            
            let page7 = Page(vc: vc7)
//            pageArray.pages.append(page7)
            pageArray.append(vc7)
        }
        
        if let vc8 = self.storyboard?.instantiateViewController(withIdentifier: "8") as? VC8ViewController {
            
            let page8 = Page(vc: vc8)
//            pageArray.pages.append(page8)
            pageArray.append(vc8)
        }
        
        if let vc9 = self.storyboard?.instantiateViewController(withIdentifier: "9") as? VC9ViewController {
            
            let page9 = Page(vc: vc9)
//            pageArray.pages.append(page9)
            pageArray.append(vc9)
        }
        
        // 맨처음 화면 세팅
//        pageViewController.setViewControllers([pageArray.pages[0].vc], direction: .forward, animated: true)
        pageViewController.setViewControllers([pageArray[0]], direction: .forward, animated: true)
        
        
        addChild(pageViewController)
        pageViewController.willMove(toParent: self)
        pageViewControllerBaseView.addSubview(pageViewController.view)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewControllerBaseView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: pageViewControllerBaseView.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: pageViewControllerBaseView.trailingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: pageViewControllerBaseView.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: pageViewControllerBaseView.bottomAnchor)
        ])
        
        // 스크롤뷰 델리게이트 연결
        if let scrollView = pageViewControllerBaseView.subviews.first?.subviews.filter({$0 is UIScrollView}).first as? UIScrollView {
            scrollView.delegate = self
        }
    }
    
}

// pageViewController 델리게이트, 데이터소스 정의
extension ViewController: UIPageViewControllerDataSource {
    
    // 현재 페이지 뷰의 이전 뷰를 미리 로드
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지의 인덱스 번호
//        guard let vcIndex = pageArray.pages.firstIndex(where: {$0.vc == viewController}) else { return nil }
        guard let vcIndex = pageArray.firstIndex(where: {$0 == viewController}) else { return nil }
        
        // 이전 페이지 인덱스
        let prevIndex = vcIndex - 1
        
        // 인덱스가 0 이상이면 통과
        guard prevIndex >= 0 else { return nil }
        
        // 인덱스가 뷰컨트롤러 카운트보다 클 수 없음
//        guard pageArray.pages.count > prevIndex else { return nil }
        guard pageArray.count > prevIndex else { return nil }
       
        // 이전 뷰 리턴
//        return pageArray.pages[prevIndex].vc
        return pageArray[prevIndex]
        
    }
    
    // 현재 페이지 뷰의 다음 뷰를 미리 로드
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지 인덱스 번호
//        guard let vcIndex = pageArray.pages.firstIndex(where: {$0.vc == viewController}) else { return nil }
        guard let vcIndex = pageArray.firstIndex(where: {$0 == viewController}) else { return nil }
        
        // 다음 페이지 인덱스
        let nextIndex = vcIndex + 1
        
        // 인덱스가
//        guard nextIndex < pageArray.pages.count else { return nil }
        guard nextIndex < pageArray.count else { return nil }
        
        // 다음 뷰 리턴
//        return pageArray.pages[nextIndex].vc
        return pageArray[nextIndex]
    }
}

extension ViewController: UIPageViewControllerDelegate {
    
    // 현재 페이지 뷰 로드가 끝났을 때
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard completed else { return }
        
        guard let currentVC = pageViewController.viewControllers?.first else { return }

//        guard let index = pageArray.pages.firstIndex(where: {$0.vc == currentVC}) else { return }
        guard let index = pageArray.firstIndex(where: {$0 == currentVC}) else { return }

//        pageArray.selectedPageIndex = index
        selectedPageIndex = index
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.nameLabel.text = categoryList[indexPath.row]
        cell.tag = indexPath.row
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let direction: UIPageViewController.NavigationDirection = pageArray.selectedPageIndex <= indexPath.row ? .forward : .reverse
        
        let direction: UIPageViewController.NavigationDirection = selectedPageIndex <= indexPath.row ? .forward : .reverse
        
//        pageArray.selectedPageIndex = indexPath.row
        selectedPageIndex = indexPath.row
        
//        pageViewController.setViewControllers([pageArray.pages[indexPath.row].vc], direction: direction, animated: true)
        pageViewController.setViewControllers([pageArray[indexPath.row]], direction: direction, animated: true)
    }
}

//extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        // 페이지 뷰 컨트롤러가 다음 뷰로 전환될때마다 x값 초기화되는 문제가 있음
//
//        print(scrollView.contentOffset.x)
//
//        let pageWidth = self.view.frame.width
//
//        // 각각의 뷰의 위치를 변환
//        for vc in pageArray.pages {
//
//            let pagePoint = vc.vc.view.convert(CGPoint(), to: view)
//
//            if pagePoint.x > CGFloat(0.0) && pagePoint.x < pageWidth {
//                if let estimatePage = pageArray.pages.firstIndex(where: {$0.vc == vc.vc}) {
//
//                    estimateOffSetX = (CGFloat(estimatePage) * pageWidth) - pagePoint.x
//
//                    // 계산된 x값을 확인해보면 살짝씩 오차가 있음
//                    //print(estimateOffSetX)
//                }
//            }
//        }
//    }
//}

 
