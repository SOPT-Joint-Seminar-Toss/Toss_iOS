//
//  PayCollectionLayout.swift
//  Toss_iOS
//
//  Created by 류희재 on 2023/05/16.
//

import UIKit

enum PayCollectionViewLayout {
    case product
    case brand
}

extension PayCollectionViewLayout {
    
    var defaultEdgeInsets: NSDirectionalEdgeInsets {
        get {
            NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        }
    }
    
    var itemSize: NSCollectionLayoutSize {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .absolute(316),
                heightDimension: .absolute(375)
            )
        case .brand:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.25),
                heightDimension: .fractionalHeight(1.0)
            )
        }
    }
    
    var itemEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        case .brand:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 13)
        }
    }
    
    var groupSize: NSCollectionLayoutSize {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .absolute(316),
                heightDimension: .absolute(375)
            )
        case .brand:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(76)
            )
        }
    }
    
    var groupEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return defaultEdgeInsets
        case .brand:
            return defaultEdgeInsets
        }
    }
    
    var headerSize: NSCollectionLayoutSize? {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(38))
        case .brand:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(96))
        }
    }
    
    var header: NSCollectionLayoutBoundarySupplementaryItem? {
        guard let headerSize = self.headerSize else { return nil}
        switch self {
        case .product:
            return NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: headerSize,
               elementKind: UICollectionView.elementKindSectionHeader,
               alignment: .top)
        case .brand:
            return NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: headerSize,
               elementKind: UICollectionView.elementKindSectionHeader,
               alignment: .top)
        }
    }
    
    var headerEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0)
        case .brand:
            return NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 12, trailing: 0)
        }
    }
    
    var footerSize: NSCollectionLayoutSize? {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(76))
        case .brand:
            return nil
        }
    }
    
    var footer: NSCollectionLayoutBoundarySupplementaryItem? {
        guard let footerSize = self.footerSize else { return nil}
        switch self {
        case .product:
            return NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: footerSize,
               elementKind: UICollectionView.elementKindSectionFooter,
               alignment: .bottom)
        case .brand:
            return nil
        }
    }
    
    var footerEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 20, leading: -22, bottom: 0, trailing: 0)
        case .brand:
            return defaultEdgeInsets
        }
    }
    
    var sectionBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior  {
        switch self {
        case .product:
            return .groupPaging
        case .brand:
            return .none
        }
    }
    
    var sectionEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0)
        case .brand:
            return NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        var supplementaryItem: [NSCollectionLayoutBoundarySupplementaryItem] = []
        
        let item = NSCollectionLayoutItem(layoutSize: self.itemSize)
        item.contentInsets = self.itemEdgeInsets
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, subitems: [item])
        group.contentInsets = self.groupEdgeInsets
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = sectionBehavior
        
        section.contentInsets = self.sectionEdgeInsets
        
        if let header = self.header {
            header.contentInsets = self.headerEdgeInsets
            supplementaryItem.append(header)
        }
        
        if let footer = self.footer {
            footer.contentInsets = self.footerEdgeInsets
            supplementaryItem.append(footer)
        }
        
        section.boundarySupplementaryItems = supplementaryItem
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
