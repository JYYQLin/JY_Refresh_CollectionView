Pod::Spec.new do |spec|
  	spec.name         = "JY_Refresh_CollectionView"
  	spec.version      = "1.0.0"
  	spec.summary      = "个人常用的一些扩展"
  	spec.homepage     = "https://github.com/JYYQLin/JY_Refresh_CollectionView"
  	spec.license      = { :type => "MIT", :file => "LICENSE" }
  	spec.author       = { "JYYQLin" => "No mailBox" }
  	spec.platform     = :ios, "13.0"
  	spec.source       = { :git => "https://github.com/JYYQLin/JY_Refresh_CollectionView.git", :tag => "#{spec.version}" }
  	spec.source_files  = "JY_Refresh_CollectionView/*.{h,m,swift}"
	spec.swift_versions = ['5.0']

  spec.dependency 'MJRefresh',   '~> 3.7.9'

end
