# LegoKit

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


LegoKit is a declarative Auto Layout wrapper written in Swift. Supports attributes, constants, multipliers and priorities.

## Usage

``` swift
let childView = UIView()
childView.backgroundColor = .redColor()
childView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(childView)

view |> childView.attribute(.CenterX) == view.attribute(.CenterX)
view |> childView.attribute(.CenterY) == view.attribute(.CenterY)
view |> childView.attribute(.Width) == 100
view |> childView.attribute(.Height) == childView.attribute(.Width) * 1.5 ! 250
```

Have a look at the [tests](LegoKitTests/LegoKitTests.swift) for more examples.

## Installation

Simply add the files in the `LegoKit` to your project. LegoKit also supports installation with [Carthage](https://github.com/Carthage/Carthage).

## Contact

Lukas Lipka

- http://github.com/lipka
- http://twitter.com/lipec
- http://lukaslipka.com

## License

LegoKit is available under the [MIT license](LICENSE). See the LICENSE file for more info.
