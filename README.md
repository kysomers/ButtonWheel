# ButtonWheel

ButtonWheel lets you create a circular collection of buttons. It's recommended for use whenever an app would want to give a lot of options or centralized navigation with a sleek, modern look. It allows for customization on images and labels for the buttons as well as more basic attributes like color, dimension, and shape.


## Use

#### ButtonWheel

`init?(coder aDecoder: NSCoder)` or `override init(frame: CGRect) `

ButtonWheel inherits from UIView. It can be instantiated either in storyboard or programmatically with the methods above from its superclass.

`ButtonWheel.setupWith(buttonPieces : [ButtonPiece], middleRadius : MiddleRadiusSize)`

A setup function that must be called after initialization to build the view according to how it should look. The `middleRadius` parameter controls how big the hole in the middle of the wheel will be. `MiddleRadiusSize` is an enum with the cases `.small`, `.medium`, and `.large`. `buttonPieces` takes in an array of `ButtonPiece` which is a type that we will use to construct each section of the ButtonWheel.

#### ButtonWheelDelegate


`didTapButtonWheelAtName(name : String)`

This is the function that will be called in the ButtonWheel's delegate to handle the buttons being pressed. The parameter passed into the function will be the name that you assigned to the tapped button.

#### ButtonPiece

`init(name : String, color : UIColor, centerOffset : CGPoint)`

Each ButtonPiece must be given a name, which will correspond to the label if you decide to add one using `setLabel(...)`. The name will also match the name that is passed into `didTapButtonWheelAtName(name : String)` when it is called in the ButtonWheel's delegate. The `color` parameter is going to be the background color for the button, and `centerOffset` WillASDFASDFASDFASDFASDFASDFASDFA SDFASDFOJASJDFASKLDFALSDFLASDFLJASDFLJASLDFJASLDF
