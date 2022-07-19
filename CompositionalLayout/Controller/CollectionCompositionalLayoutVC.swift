//
//  CollectionCompositionalLayoutVC.swift
//  CompositionalLayout
//
//  Created by samy on 19/07/2022.
//
//

import UIKit

@available(iOS 13.0, *)
class CollectionCompositionalLayoutVC: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    
    var menuItems:[MenuModel] = [MenuModel(image: #imageLiteral(resourceName: "Mask Group 75")),
                                 MenuModel(image: #imageLiteral(resourceName: "Mask Group 75")),
                                 MenuModel(image: #imageLiteral(resourceName: "Mask Group 75")),
                                 MenuModel(image: #imageLiteral(resourceName: "Mask Group 75")),
                                 MenuModel(image: #imageLiteral(resourceName: "Mask Group 75")),
                                 MenuModel(image: #imageLiteral(resourceName: "Mask Group 75")),
                                 MenuModel(image: #imageLiteral(resourceName: "Mask Group 75"))]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.register(UINib(nibName:HeaderViewCollection.identifier, bundle:nil), forSupplementaryViewOfKind: "header", withReuseIdentifier:HeaderViewCollection.identifier)
    }
    
    func createCompositionalLayout ()-> UICollectionViewCompositionalLayout  {
        let layout = UICollectionViewCompositionalLayout {[weak self] (index,environemt) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index:index, environemt: environemt)
        }
        return layout
    }
    
    func createSectionFor(index:Int,environemt:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection{
        switch index {
        case 0:
            return createFirstSection()
        case 1:
            return createSecondSection()
        case 2:
            return createThirdSection()
        default:
            return createFirstSection()
        }
    }
    
    func createFirstSection()-> NSCollectionLayoutSection{
        let inset : CGFloat = 2.5
        //Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        //headers
        //let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
       //                                      heightDimension: .absolute(44))
        
//        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment:.top)
//        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func createSecondSection()-> NSCollectionLayoutSection{
        let inset : CGFloat = 2.5
        //Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                             heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:groupSize, subitem: item, count: 2)
      
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .absolute(44))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment:.top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func createThirdSection()-> NSCollectionLayoutSection{
        let inset : CGFloat = 2.5
        //Item
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(0.5))
        let smallitem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallitem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        
        let LargeitemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .fractionalHeight(1))
        let Largitem = NSCollectionLayoutItem(layoutSize: LargeitemSize)
        Largitem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        
        //Group
        let verticalgroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),heightDimension: .fractionalHeight(1))
        let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalgroupSize, subitems: [smallitem])
        
        let horizontalgroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.4))
        let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalgroupSize, subitems: [Largitem,verticalgroup,verticalgroup])
        
        let section = NSCollectionLayoutSection(group: horizontalgroup)
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        //headers
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .absolute(44))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment:.top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    
    
}
@available(iOS 13.0, *)
extension CollectionCompositionalLayoutVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 2 ? 15 : 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind:"header", withReuseIdentifier:HeaderViewCollection.identifier, for:indexPath) as? HeaderViewCollection else {return UICollectionReusableView()}
          view.title = indexPath.section == 1 ? "See All sections" : "See All categories"
            return view
    }

}

//extension CollectionCompositionalLayoutVC:UICollectionViewDataSource{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 3
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0{
//        return menuItems.count
//        }else if section == 1{
//        return menuItems.count
//        }else{
//        return menuItems.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? Cell else {return UICollectionViewCell()}
//        if indexPath.section == 0{
//        cell.images.image = menuItems[indexPath.item].image
//        }else if indexPath.section == 1{
//        cell.images.image = menuItems[indexPath.item].image
//        }else{
//        cell.images.image = menuItems[indexPath.item].image
//        }
//      return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind:"header", withReuseIdentifier: "HeaderViewCollection", for:indexPath) as? HeaderViewCollection else {return UICollectionReusableView()}
//          view.title = indexPath.section == 1 ? "See All sections" : "See All categories"
//            return view
//    }
//
//}
//
