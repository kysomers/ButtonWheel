# ButtonWheel

ButtonWheel lets you create a circular collection of buttons. It's recommended for use whenever an app would want to give a lot of options or centralized navigation with a sleek, modern look. It allows for customization on images and labels for the buttons as well as more basic attributes like color, dimension, and shape.


## Use

`init?(coder aDecoder: NSCoder)` or `override init(frame: CGRect) `

ButtonWheel inherits from UIView. It can be instantiated either in storyboard or programmatically with the methods above from its superclass.

`func setupWith(buttonPieces : [ButtonPiece], middleRadius : MiddleRadiusSize)`

A setup function that must be called after initialization to build the view according to how it should look. The `middleRadius` parameter controls how big the hole in the middle of the wheel will be. `MiddleRadiusSize` is an enum with the cases `.small`, `.medium`, and `.large`. `buttonPieces` takes in an array of `ButtonPiece` which is a type that we will use to construct each section of the ButtonWheel.


` func didTapButtonWheelAtName(name : String)`

This is the function that will be called in the ButtonWheel's delegate to handle the buttons being pressed. The parameter passed into the function will be the name that you assigned to the tapped button.
