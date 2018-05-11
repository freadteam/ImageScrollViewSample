/*
 UIScrollViewの表示領域 = scrollView.frame
 UIScrollViewの内容領域 = scrollView.contentSize
 表示領域は内容領域が見える範囲
 内容領域はスクロールして見える領域
 
 */

/*
 scrollviewはstrotyboardで実装する。
 その際、paging Enabledにチェックを入れるのを忘れずに！
 ImageViewはコードで書く
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageNameArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //表示する画像の枚数（Int型を CGFloat型に変換）
        let index = CGFloat(imageNameArray.count)
        
        // スクロールビューのコンテンツサイズを指定
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * index,
                                        height: self.scrollView.frame.size.height)
        
        showImages(index: imageNameArray.count)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画像を表示する
    func showImages(index: Int) {
        //画像がない場合
        if index == 0 {
        } else {
            
            for i in 0..<index {
                
                let x = self.view.frame.width
                let addX = x*CGFloat(i)
                
                let width = scrollView.frame.width
                let hight = scrollView.frame.height
                
                let showIamgeView = UIImageView()
                //x,yはaddsubviewするものを基準にしている
                showIamgeView.frame = CGRect(x: 0 + addX , y: 0, width: width, height: hight)
                //表示するときの形式（AspectFitとか）
                showIamgeView.contentMode = UIViewContentMode.scaleAspectFit
                showIamgeView.backgroundColor = UIColor.clear
                showIamgeView.clipsToBounds = true
                showIamgeView.image = UIImage(named: imageNameArray[i])
                
                self.scrollView.addSubview(showIamgeView)
            }
            
        }
        
    }
    
    
    
    
}

