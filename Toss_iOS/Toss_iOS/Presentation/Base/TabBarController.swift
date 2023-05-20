//
//  TabBarController.swift
//  Toss_iOS
//
//  Created by 류창휘 on 2023/05/20.
//

import UIKit

class TabBarController : UITabBarController {

    //MARK: - Properties
    //MARK: - UI Components
    let mainTab = UINavigationController(rootViewController: MainViewController())
    let benefitTab = UINavigationController(rootViewController: MainViewController())
    let payTab = UINavigationController(rootViewController: PayViewController())
    let stockTab = UINavigationController(rootViewController: MainViewController())
    let financialTips = UINavigationController(rootViewController: MainViewController())

    let mainTabBarItem = UITabBarItem(title: "홈", image: Image.homeFilled, tag: 0)
    let benefitTabBarItem = UITabBarItem(title: "혜택", image: Image.benefit, tag: 1)
    let payTabBarItem = UITabBarItem(title: "토스페이", image: Image.tossPay, tag: 3)
    let stockTabBarItem = UITabBarItem(title: "주식", image: Image.stock, tag: 4)
    let financialTipsTabBarItem = UITabBarItem(title: "금융팁", image: Image.financialTip, tag: 5)

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

    }

    //MARK: - Custom Method
    private func setUI(){
        mainTab.tabBarItem = mainTabBarItem
        benefitTab.tabBarItem = benefitTabBarItem
        payTab.tabBarItem = payTabBarItem
        stockTab.tabBarItem = stockTabBarItem
        financialTips.tabBarItem = financialTipsTabBarItem
        viewControllers = [mainTab, benefitTab, payTab, stockTab, financialTips]
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.isTranslucent = true
        tabBar.barTintColor = .tossWhite
        tabBar.tintColor = UIColor(hex: 0x000000) ///fix
        tabBar.unselectedItemTintColor = .tossGrey300
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderColor = UIColor.tossGrey100.cgColor
        tabBar.layer.borderWidth = 1
        view.backgroundColor = UIColor(hex: 0x000000)
    }

    //MARK: - Action Method
}
