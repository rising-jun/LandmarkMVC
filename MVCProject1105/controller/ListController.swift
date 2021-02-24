//
//  ListController.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/05.
//

import UIKit
import RxSwift

class ListController: BaseViewController {
    private var disposeBag = DisposeBag()
    lazy var listView: ListView = ListView(frame: view.bounds)
    private let model = ListModel()
    
    override func setup() {
        super.setup()
        view = listView
    }
    
    override func bind() {
        super.bind()
        
        
        model.getAPIData().bind { [weak self] (tourArray) in
            
            for e in tourArray{
                self?.model.getImageFromURL(tourInfo: e).bind(onNext: { (image) in
                    self?.listView.setScrollViewDatas(tourInfo: e)
                    self?.listView.setCellImage(image: image)
                    
                })
            }
            
        }.disposed(by: disposeBag)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.black
        navigationItem.title = "관광명소"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }


}

