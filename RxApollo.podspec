Pod::Spec.new do |s|
  s.name             = 'RxApollo'
  s.version          = '0.4.0'
  s.summary          = 'RxSwift extensions for Apollo.'
 
  s.description      = <<-DESC
    This is an Rx extension that provides an easy and straight-forward way
    to use Apollo requests (fetch, watch, mutate) as an Observable
                       DESC
 
  s.homepage         = 'https://github.com/scottrhoyt/RxApollo'
  s.license          = 'MIT'
  s.author           = { 'Scott Hoyt' => 'scottrhoyt@gmail.com' }
  s.source           = { :git => 'https://github.com/scottrhoyt/RxApollo.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'RxApollo/*.swift'
	
  s.dependency 'Apollo', '~> 0.6.0'
  s.dependency 'RxSwift', '~> 4.0'
 
end