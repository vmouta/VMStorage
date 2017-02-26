Pod::Spec.new do |s|
    s.name             = "VMStorage"
    s.version          = "0.0.1"
    s.summary          = "A simple storega solution."
    s.description      = <<-DESC
                        A Storage pod
                       DESC

    s.homepage         = "https://github.com/vmouta/VMStorage"
    s.license          = { :type => "MIT", :file => "LICENSE" }
    s.author           = { "Vasco Mouta" => "vasco.mouta@gmail.com" }
    s.source           = { :git => "https://github.com/vmouta/VMStorage.git", :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/vmouta'

    s.platform     = :ios, '8.0'
    s.requires_arc = true

    s.source_files = 'Pod/Classes/**/*'

    s.framework  = "Foundation"

end
