Pod::Spec.new do |s|
  s.name = 'DHKRMStore'
  s.version = '1.4'
  s.license = 'Apache 2.0'
  s.summary = 'A lightweight iOS library for In-App Purchases that adds blocks and notifications to StoreKit, plus verification, persistence and downloads.'
  s.homepage = 'https://github.com/DuetHealth/RMStore'
  s.author = 'Hermes Pique'
  s.source = { :git => 'https://github.com/DuetHealth/RMStore.git', :tag => "v#{s.version}" }
  s.platform = :ios, '7.0'
  s.frameworks = 'StoreKit'
  s.requires_arc = true
  s.default_subspec = 'Core'
  s.xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}

  s.subspec 'Core' do |core|
    core.source_files = 'RMStore/*.{h,m}'
  end

  s.subspec 'KeychainPersistence' do |kp|
    kp.dependency 'DHKRMStore/Core'
    kp.source_files = 'RMStore/Optional/RMStoreKeychainPersistence.{h,m}'
    kp.frameworks = 'Security'
  end

  s.subspec 'NSUserDefaultsPersistence' do |nsudp|
    nsudp.dependency 'DHKRMStore/Core'
    nsudp.source_files = 'RMStore/Optional/RMStoreUserDefaultsPersistence.{h,m}', 'RMStore/Optional/RMStoreTransaction.{h,m}'
  end

  s.subspec 'AppReceiptVerifier' do |arv|
    arv.dependency 'DHKRMStore/Core'
    arv.platform = :ios, '7.0'
    arv.source_files = 'RMStore/Optional/RMStoreAppReceiptVerifier.{h,m}', 'RMStore/Optional/RMAppReceipt.{h,m}'
    arv.dependency 'OpenSSL-iOS'
    arv.libraries = 'ssl', 'crypto'
    arv.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/OpenSSL-iOS/openssl/**", 'LIBRARY_SEARCH_PATHS' => "${PODS_ROOT}/OpenSSL-iOS/" }
  end

  s.subspec 'TransactionReceiptVerifier' do |trv|
    trv.dependency 'DHKRMStore/Core'
    trv.source_files = 'RMStore/Optional/RMStoreTransactionReceiptVerifier.{h,m}'
  end

end
