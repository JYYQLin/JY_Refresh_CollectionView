//
//  JY_Refresh_BaseView.swift
//  JY_Refresh_CollectionView
//
//  Created by One Lang on 2024/8/21.
//

import UIKit

open class JY_Base_TableViewCell: UITableViewCell {
     open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
}

open class JY_Base_CollectionViewCell: UICollectionViewCell {
    
     open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
}


open class JY_Base_CollectionReusableView: UICollectionReusableView {
     open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
}

open class JY_Base_TableViewHeaderFooterView: UITableViewHeaderFooterView {
    
     open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
}
