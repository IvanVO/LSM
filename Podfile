# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LSM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LSM
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
