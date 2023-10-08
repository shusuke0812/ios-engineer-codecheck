# YUMEMI.inc, Coding test for iOS engineer

### System requirements

- Xcode version 13.2.1(13C100)
- pod version 1.11.3
- target iOS 13.0

### Get started

#### Git

1. Install `git flow`  command

```bash
$ brew install git-flow
```

#### Grove the code
1. Clone this code in your PC
2. Change a branch to `develop`
3. Install packages

```ruby
$ pod install
```

4. Open project with Xcode

```bash
$ open iOSEngineerCodeCheck.xcworkspace
```

### Design

- Create one ViewController and one Stroyboard for one screen
- Use Redux
  - class relationship
    <img width=800 src="https://user-images.githubusercontent.com/33107697/202435526-17aee328-f5d5-4124-b886-a5066a1fc7ad.png">
  - file name
    - screen name + class name.swift

### UI

|Initial|Searching|Detail|
| :----------------------------------------: | :----------------------------------------: | :----------------------------------------: |
|![Initial](README_Images/search_screen.png)|![Searching](README_Images/search_result_screen.png)|![Detail](README_Images/search_result_detail_screen.png)|

|                  iPad                  |
| :------------------------------------: |
| ![iPad](README_Images/iPad_screen.png) |

### Reference

- [GitHub API document](https://docs.github.com/ja/rest/reference/search#search-repositories)

### Note

- Find Xcode env variables

```bash
$ xcodebuild -showBuildSettings | grep "PROJECT"
```

- GraphQL
  - Create package configuration: `$ ./apollo-ios-cli init --schema-name GitHubGraphQL --module-type swiftPackageManager`
  - Generate package: `$ ./apollo-ios-cli generate`
  - [Apollo Reference](https://www.apollographql.com/docs/ios/tutorial/tutorial-add-graphql-schema#create-your-codegen-configuration)
