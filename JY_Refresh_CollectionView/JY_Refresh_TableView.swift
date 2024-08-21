//
//  JY_Refresh_TableView.swift
//  JY_Refresh_TableView
//
//  Created by One Lang on 2024/8/21.
//

import UIKit
import MJRefresh

class JY_Refresh_TableView: UITableView {
    var yq_refresh_data_block: (() -> Void)?
    var yq_refresh_more_data_block: (() -> Void)?
    
    private(set) lazy var yq_hidden_footer_refresh = true
    private(set) lazy var yq_hidden_header_refresh = false
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = UIColor.clear
        contentInsetAdjustmentBehavior = .never
        automaticallyAdjustsScrollIndicatorInsets = false
    }    
    
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

extension JY_Refresh_TableView {
    @objc dynamic open func yq_set_refresh() {
        if mj_header != nil {
            mj_header = nil
        }
        
        if mj_footer != nil {
            mj_footer = nil
        }
        
        mj_header = MJRefreshStateHeader(refreshingTarget: self, refreshingAction: #selector(yq_load_data))
        mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: #selector(yq_request_more_data))
        mj_footer?.isHidden = yq_hidden_footer_refresh
    }
    
    public func yq_remove_refresh() {
        mj_header = nil
        mj_footer = nil
    }
}

extension JY_Refresh_TableView {

    public func yq_show_refresh() {
        yq_hidden_header_refresh = false
        yq_hidden_footer_refresh = false
        mj_header?.isHidden = yq_hidden_header_refresh
        mj_footer?.isHidden = yq_hidden_footer_refresh
    }
    
    public func yq_hidden_refresh() {
        yq_hidden_header_refresh = true
        yq_hidden_footer_refresh = true
        mj_header?.isHidden = yq_hidden_header_refresh
        mj_footer?.isHidden = yq_hidden_footer_refresh
    }

    @objc public func yq_hidden_header_refresh(isHidden: Bool) {
        yq_hidden_header_refresh = isHidden
        mj_header?.isHidden = yq_hidden_header_refresh
    }
    
    @objc public func yq_hidden_footer_refresh(isHidden: Bool) {
        yq_hidden_footer_refresh = isHidden
        mj_footer?.isHidden = yq_hidden_footer_refresh
    }
}

extension JY_Refresh_TableView {
    @objc public func yq_load_data(){
        if yq_hidden_header_refresh == true {
            yq_end_header_refresh()
            return
        }
        
        if yq_refresh_data_block != nil {
            yq_refresh_data_block!()
        }
        
        if yq_hidden_footer_refresh == false {
            yq_reset_footer_refresh()
        }
    }
    
    @objc public func yq_begin_header_refresh() {
        if yq_hidden_header_refresh == true {
            yq_end_header_refresh()
            return
        }
        
        if yq_hidden_footer_refresh == false {
            yq_reset_footer_refresh()
        }
        
        mj_header?.beginRefreshing()
    }
    
    public func yq_end_header_refresh() {
        mj_header?.endRefreshing()
    }
}

extension JY_Refresh_TableView {

    @objc public func yq_request_more_data() {
        if yq_hidden_footer_refresh == true {
            yq_end_footer_refresh()
            return
        }
        
        if yq_refresh_more_data_block != nil {
            yq_refresh_more_data_block!()
        }
    }
    
    public func yq_begin_footer_refresh() {
        if yq_hidden_footer_refresh == true {
            yq_end_footer_refresh()
            return
        }
        
        mj_footer?.beginRefreshing()
    }
    
    public func yq_end_footer_refresh() {
        mj_footer?.endRefreshing()
    }
    
    public func yq_end_footer_refresh_with_noMore() {
        mj_footer?.endRefreshingWithNoMoreData()
    }
    
    public func yq_reset_footer_refresh() {
        mj_footer?.resetNoMoreData()
    }
}
