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
    
    private let tossMainButton = UIButton().then {
        $0.setImage(Image.logoToss, for: .normal)
    }
    private let alarmButton = UIButton().then {
        $0.setImage(Image.alarm, for: .normal)
    }
    private let menuButton = UIButton().then {
        $0.setImage(Image.menu, for: .normal)
    }
    
    
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
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = tossMainButton
        let rightBarLeftButton = UIBarButtonItem()
        rightBarLeftButton.customView = alarmButton
        let rightBarRightButton = UIBarButtonItem()
        rightBarRightButton.customView = menuButton
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItems = [rightBarRightButton, rightBarLeftButton]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension MainViewController {
    
}

