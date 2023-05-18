//
//  MainViewController.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/18.
//

import UIKit


class MainViewController : UIViewController {
    //MARK: - Properties

    //MARK: - UI Components
    private var mainView = MainView()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        mainView = MainView(frame: self.view.frame)
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    //MARK: - Custom Method
    private func setUI(){
    }
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension MainViewController {
    
}

