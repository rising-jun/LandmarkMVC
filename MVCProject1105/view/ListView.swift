//
//  ListView.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/05.
//

import Foundation
import UIKit
import SnapKit


class ListView: BaseView{
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var cellArray: [PostCell] = []
    lazy var count = 0
    var y = 0
    override func setup() {
        super.setup()
        
        addSubview(scrollView)
        scrollView.contentSize.width = frame.width
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
        
        scrollView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
    }
    
    public func setScrollViewDatas(tourInfo: TourInfo){
        scrollView.contentSize.height = 510 * CGFloat(count)
    
        
            let postCell = PostCell()
            cellArray.append(postCell)
            scrollView.addSubview(postCell)
            postCell.snp.makeConstraints { (make) in
                make.leading.equalTo(self).offset(10)
                make.trailing.equalTo(self).offset(-10)
                make.top.equalTo(y)
                make.height.equalTo(500)
            
            }
            
            postCell.setCellData(cellData: tourInfo)
            y += 510
        
    }
    
    public func setCellImage(image: UIImage){
        print("\(count) + \(cellArray.count)")
        
        cellArray[count].setImage(image: image)
        count += 1
    }
    
}
