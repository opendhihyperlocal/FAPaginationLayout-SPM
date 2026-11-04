Pod::Spec.new do |s|

  s.swift_version    = '4.2'
  s.name             = 'FAPaginationLayout'
  s.version          = '1.0.0'
  s.summary          = 'Custom pagination layout for collection view.'

  s.description      = <<-DESC
Custom layout for collection view to add pagination.
                       DESC

  s.homepage         = 'https://github.com/opendhihyperlocal/FAPaginationLayout-SPM'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Fahid Attique' => 'fahidattique55@gmail.com' }
  s.source           = { :git => 'https://github.com/opendhihyperlocal/FAPaginationLayout-SPM.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Sources/FAPaginationLayout/**/*.swift'

end
