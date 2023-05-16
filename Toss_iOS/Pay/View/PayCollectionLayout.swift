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
    
    var itemSize: NSCollectionLayoutSize {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .absolute(316),
                heightDimension: .absolute(375)
            )
        case .brand:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
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
                widthDimension: .absolute(80),
                heightDimension: .absolute(76)
            )
        }
    }
    
    var groupEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        case .brand:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 13)
        }
    }
    
    var headerSize: NSCollectionLayoutSize {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(38))
        case .brand:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        }
    }
    
    var header: NSCollectionLayoutBoundarySupplementaryItem {
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
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        }
    }
    
    var footerSize: NSCollectionLayoutSize {
        switch self {
        case .product:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(76))
        case .brand:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        }
    }
    
    var footer: NSCollectionLayoutBoundarySupplementaryItem {
        switch self {
        case .product:
            return NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: footerSize,
               elementKind: UICollectionView.elementKindSectionFooter,
               alignment: .bottom)
        case .brand:
            return NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: footerSize,
               elementKind: UICollectionView.elementKindSectionFooter,
               alignment: .bottom)
        }
    }
    
    var footerEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 20, leading: -22, bottom: 0, trailing: 0)
        case .brand:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        }
    }
    
    var sectionEdgeInsets: NSDirectionalEdgeInsets {
        switch self {
        case .product:
            return NSDirectionalEdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 0)
        case .brand:
            return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        print(self.groupSize)
        let item = NSCollectionLayoutItem(layoutSize: self.itemSize)
        item.contentInsets = self.itemEdgeInsets
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, subitems: [item])
        group.contentInsets = self.groupEdgeInsets
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.contentInsets = self.sectionEdgeInsets
        
        let header = self.header
        header.contentInsets = self.headerEdgeInsets
        let footer = self.footer
        footer.contentInsets = self.footerEdgeInsets
        
        section.boundarySupplementaryItems = [header, footer]
 
        
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
