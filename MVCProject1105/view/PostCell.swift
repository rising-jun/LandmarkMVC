//
//  CustomCell.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/09.
//

import Foundation
import UIKit
import SnapKit
class PostCell: BaseView{
    private let photoGraphLabel = UILabel()
    private let titleLabel = UILabel()
    private let locationLabel = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCell()
    }
    
    private func setCell(){
        backgroundColor = .white
        
        addSubViews(photoGraphLabel, titleLabel, locationLabel, imageView)
        
        photoGraphLabel.text = "photographLabel"
        photoGraphLabel.numberOfLines = 0
        photoGraphLabel.fitToFrame()
        photoGraphLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(self).offset(10)
        }
        
        imageView.backgroundColor = .yellow
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.top.equalTo(photoGraphLabel.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
        
        
        titleLabel.text = "titleLabel"
        titleLabel.numberOfLines = 0
        titleLabel.fitToFrame()
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
        
        locationLabel.text = "location Label"
        locationLabel.numberOfLines = 3
        locationLabel.fitToFrame()
        locationLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
        
    }
    
    public func setCellData(cellData: TourInfo){
        photoGraphLabel.text = "작가이름 : \(cellData.galPhotographer ?? "")"
        locationLabel.text = "장소 : \(cellData.galPhotographyLocation ?? "")"
        titleLabel.text = cellData.galTitle
    }
    
    public func setImage(image: UIImage){
        imageView.image = image
    }
    
}
