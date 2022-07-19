//
//  HeaderViewCollection.swift
//  
//
//  Created by samy on 19/07/2022.
//  
//

import UIKit

class HeaderViewCollection: UICollectionReusableView {
    @IBOutlet weak var titleLbL:UILabel!

    static var identifier = "HeaderViewCollection"
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    var title:String?{
        didSet{
        titleLbL.text = title
        }
    }
    
}
