Pod::Spec.new do |s|
s.name             = 'LeftAlignedCollectionViewLayout'
s.version          = '0.1.0'
s.summary          = 'A UICollectionViewFlowLayout implementation to left-align the content in a UICollectionView'

s.description      = <<-DESC
A UICollectionViewFlowLayout implementation to left-align the content in a UICollectionView.
DESC

s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.homepage         = 'https://github.com/CheeseRoot/LeftAlignedCollectionViewLayout'
s.author           = { 'Sudhanshu Singh' => 'sudhanshu5575@gmail.com' }
s.source           = { :git => 'https://github.com/CheeseRoot/LeftAlignedCollectionViewLayout.git', :tag => s.version.to_s }
s.swift_version    = '4.0'

s.ios.deployment_target = '9.0'
s.source_files = 'LeftAlignedCollectionViewLayout/LeftAlignedCollectionViewLayout.swift'

end
