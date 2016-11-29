# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Comment the next line if you're not using Swift and don't want to use dynamic frameworks

use_frameworks!

def signin_pods
    pod 'Google/SignIn'
end

target 'DCgram' do
    # Pods for DCgram
    pod 'DCKit', :git => 'https://bitbucket.org/decodehq/dckit.git', :branch => 'swift-3.0'
    
    pod 'SnapKit'
    
    signin_pods
end

target 'BusinessLayer' do
    signin_pods
end
