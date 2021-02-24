//
//  SplashController.swift
//  MVCProject1105
//
//  Created by 김동준 on 2020/11/05.
//

import Foundation
import UIKit
import RxSwift
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
    }
    
    public func setup() {
        
    }
    
    public func bind() {
        
    }
}


class SplashController: BaseViewController{
    lazy var splashView: UIView = SplashView(frame: view.bounds)
    private var disposeBag = DisposeBag()
    override func setup() {
        super.setup()
        view = splashView
    }
    
    override func bind() {
        super.bind()
        let timer = Observable<Int>.timer(.seconds(2), scheduler: MainScheduler.instance).take(2)
        timer.filter{$0 == 2}.subscribe { [weak self] (_) in
            let listController = ListController()
            let nav = UINavigationController()
            nav.pushViewController(listController, animated: true)
            nav.modalPresentationStyle = .fullScreen
           // nav.navigationBar.setBackColor()
            
            self?.present(nav, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
}

extension UINavigationBar{
    func setBackColor(){
        barTintColor = .black
        shadowImage = UIImage()
        isTranslucent = false
    }
}

