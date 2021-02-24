//
//  ListModel.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/05.
//

import Foundation
import RxSwift
import RxCocoa
import RxCodable

class ListModel{
    private(set) var tourImage = [TourInfo: UIImage]()
    
    
    public func getAPIData() -> Observable<[TourInfo]>{
        let url = "http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/galleryList?serviceKey=8KMZQMPCBSiU%2F6nqRFH1iBw9BH9Ww2xgitwSo3yy5FIEOyfEFxiyeExpay9ZucnXtW%2BcrMmdXakp815ZYnEmHg%3D%3D&pageNo=1&numOfRows=10&MobileOS=ETC&MobileApp=AppTest&arrange=A&_type=json"
        let request = URLRequest(url: URL(string: url)!)
        return URLSession.shared.rx
            .data(request: request)
            .map(TourInfoRespons.self)
            .observeOn(MainScheduler.instance)
            .map{($0.response?.body?.items?.item)!}
        }
    
    public func getImageFromURL(tourInfo: TourInfo) -> Observable<UIImage>{
        let request = URLRequest(url: tourInfo.galWebImageUrl)
        return URLSession.shared.rx.data(request: request)
            .subscribeOn(SerialDispatchQueueScheduler.init(qos: .utility))
            .observeOn(MainScheduler.instance)
            .map{UIImage(data: $0)!}
    }
    
}
        
    
