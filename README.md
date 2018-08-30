<p align="center">
    <img src="Artwork/logo.png" width="890" alt="Tabman"/>
</p>

<p align="center">
    <a href="https://travis-ci.org/uias/Tabman">
        <img src="https://travis-ci.org/uias/Tabman.svg?branch=master" />
    </a>
    <img src="https://img.shields.io/badge/Swift-4-orange.svg?style=flat" />
    <a href="https://cocoapods.org/pods/Tabman">
        <img src="https://img.shields.io/cocoapods/v/Tabman.svg" alt="CocoaPods" />
    </a>
	<a href="https://cocoapods.org/pods/Tabman">
        <img src="https://img.shields.io/cocoapods/p/Tabman.svg" alt="Platforms" />
    </a>
	<a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" />
    </a>
	<a href="https://codecov.io/gh/uias/Tabman">
        <img src="https://codecov.io/gh/uias/Tabman/branch/master/graph/badge.svg" />
    </a>
	<a href="https://github.com/uias/Tabman/releases">
        <img src="https://img.shields.io/github/release/uias/Tabman.svg" />
    </a>
</p>

<p align="center">
    <img src="Artwork/header.png" width="890" alt="Tabman"/>
</p>
 
## ⭐️ Features
TODO

## 📋 Requirements
Tabman requires iOS 9; and is written in Swift 4.2.

## 📲 Installation
### CocoaPods
Tabman is available through [CocoaPods](http://cocoapods.org):
```ruby
pod 'Tabman', '~> 2.0'
```

### Carthage
Tabman is also available through [Carthage](https://github.com/Carthage/Carthage):
```ogdl
github "uias/Tabman" ~> 2.0
```

## 🚀 Usage

### First things first.
Getting Tabman up and running could not be simpler. Get your `PageboyViewController` set up first...

```swift
class TabViewController: TabmanViewController {

    let viewControllers = [UIViewController(), UIViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
    }
}

extension TabViewController: PageboyViewControllerDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
```
You can then add bars to the view controller and provide them with a data source.
```swift
class TabViewController: TabmanViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self

        let bar = Bar.ButtonBar()
        self.addBar(bar, dataSource: self, at: .top)
    }
}

extension TabViewController: BarDataSource {

    func barItem(for tabViewController: TabmanViewController, at index: Int) -> BarItem {
        let title = "Page \(index)"
        return BarItem(title: title)
    }
}
```


## ⚠️ Troubleshooting
If you are encountering issues with Tabman, please check out the [Troubleshooting Guide](Docs/TROUBLESHOOTING.md).

If you're still having problems, feel free to raise an [issue](https://github.com/uias/Tabman/issues/new).

## 👨🏻‍💻 About
- Created by [Merrick Sapsford](https://github.com/msaps) ([@MerrickSapsford](https://twitter.com/MerrickSapsford))
- Contributed to by a growing [list of others](https://github.com/uias/Tabman/graphs/contributors).


## ❤️ Contributing
Bug reports and pull requests are welcome on GitHub at [https://github.com/uias/Tabman](https://github.com/uias/Tabman).

## 👮🏻‍♂️ License
The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
