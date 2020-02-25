# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common
  pod 'SwiftLint'
end

def application
  pod 'NSObject+Rx'
  pod 'Reusable'
  pod 'MBProgressHUD'
  pod 'MJRefresh'
  pod 'Kingfisher', '~> 5.0'
end

def network
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'OrderedSet'
  pod 'Alamofire'
end

target 'Domain' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Domain

  target 'DomainTests' do
    # Pods for testing
  end

end

target 'MVVMCleanArchitecture' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MVVMCleanArchitecture

  target 'MVVMCleanArchitectureTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MVVMCleanArchitectureUITests' do
    # Pods for testing
  end

end

target 'NetworkPlatform' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NetworkPlatform
  common
  network

  target 'NetworkPlatformTests' do
    # Pods for testing
  end

end
