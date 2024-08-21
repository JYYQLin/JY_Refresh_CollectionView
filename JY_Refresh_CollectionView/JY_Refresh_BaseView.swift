//
//  JY_Refresh_BaseView.swift
//  JY_Refresh_CollectionView
//
//  Created by One Lang on 2024/8/21.
//

import UIKit

class JY_Base_TableViewCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    @objc class func yq_ID() -> String {
        return "\(self)"
    }
}

class JY_Base_CollectionViewCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    @objc class func yq_ID() -> String {
        return "\(self)"
    }
}


class JY_Base_CollectionReusableView: UICollectionReusableView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    @objc class func yq_ID() -> String {
        return "\(self)"
    }
}

class JY_Base_TableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    @objc class func yq_ID() -> String {
        return "\(self)"
    }
}
