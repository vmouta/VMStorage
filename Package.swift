import PackageDescription

let package = Package(
    name: "VMStorage",
    dependencies: [
        .Package(url: "https://github.com/Alamofire/Alamofire.git",
                 majorVersion: 4)
    ],
    exclude: ["Example"]
)
