//
//  SplashView.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/05.
//

import Foundation
import UIKit
import SnapKit

class BaseView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .black
    }
}

class SplashView: BaseView{
    lazy var imageView = UIImageView()
    
    override func setup() {
        super.setup()
        
        imageView.image = UIImage(named: "splashImage")
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(safeAreaLayoutGuide.snp.height)
            make.center.equalToSuperview()
        }
        
    }
}


extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UILabel{
    func fitToFrame(){
        minimumScaleFactor = 0.1
        adjustsFontSizeToFitWidth = true
    }
}
