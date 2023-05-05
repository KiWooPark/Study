//
//  ViewController.swift
//  crawlingStudy
//
//  Created by PKW on 2023/04/28.
//

import UIKit
import SwiftSoup
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var testImageView: UIImageView!
    var copyList = [String]()
    
    let imageManager = ImageFileManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = "#menu_list > li"
        let test2 = "a > div > div.cont_text_box > div:nth-child(1) > div.cont_text_inner.text_wrap.cont_text_title > div > b"
        let test3 = "a > div > div.cont_gallery_list_img > img"
        
        let engName = "a > div > div.cont_text_box > div:nth-child(1) > div.cont_text_inner.text_wrap.cont_text_info > div"
        
        for page in 1...10 {
            let url = "https://www.mega-mgccoffee.com/menu/menu.php?page=\(page)menu_category1=&menu_category2=&category="
            
            AF.request(url).responseString { (response) in
                guard let html = response.value else {
                    return
                }
                
                do {
                    let doc: Document = try SwiftSoup.parse(html)
                    let productElements: Elements = try doc.select(test)
    
                    for i in productElements {
    //                    print("이름")
    //                    print(try i.select(engName).text())
    //                    print("이미지 주소")
    //                    print(try i.select(test3).attr("src"))

                        let imageUrl = try i.select(test3).attr("src")
                        guard let url = URL(string: imageUrl) else { return }

                        let data = try Data(contentsOf: url)
                        var name = try i.select(engName).text()
                        
                        let image = UIImage(data: data)
                        
                        
                        if self.copyList.contains(where: {$0 == name}) {
                           name = name + "-1"
                        }
                        self.copyList.append(name)
                        name = name + ".jpeg"
                        
                        // 디바이스에 저장하기
                        self.imageManager.saveImage(image: image ?? UIImage(), name: name ) { _ in
                            print("end")
                        }
                    }
                } catch {
                    print("crawl error")
                }
            }
            
            
        }
    }
}

class ImageFileManager {
    static let shared: ImageFileManager = ImageFileManager()
    // Save Image
    // name: ImageName
    func saveImage(image: UIImage, name: String,
                   onSuccess: @escaping ((Bool) -> Void)) {
        guard let data: Data
                = image.jpegData(compressionQuality: 1)
                ?? image.pngData() else { return }
        if let directory: NSURL =
            try? FileManager.default.url(for: .documentDirectory,
                                         in: .userDomainMask,
                                         appropriateFor: nil,
                                         create: false) as NSURL {
            do {
                print(directory)
                try data.write(to: directory.appendingPathComponent(name)!)
                onSuccess(true)
            } catch let error as NSError {
                print("Could not saveImage🥺: \(error), \(error.userInfo)")
                onSuccess(false)
            }
        }
    }
}

//20220630171805_1656577085458_7skvYFEJwH
//20220630153107_1656570667406_prmnWqNIw2
