# Uncomment this line to define a global platform for your project

platform :ios, '10.0'
use_frameworks!

target 'GogoCinema' do
  inhibit_all_warnings!
  pod 'Ji'
  pod 'SDWebImage'
  pod 'RealmSwift'
end

target 'GogoCinemaTests' do

end

post_install do | installer |
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.1'
    end
  end
end