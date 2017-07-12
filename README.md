# ButtonWheel

ButtonWheel lets you create a circular collection of buttons. It's recommended for use whenever an app would want to give a lot of options or centralized navigation with a sleek, modern look. It allows for customization on images and labels for the buttons as well as more basic attributes like color, dimension, and shape.

<img src="http://i.imgur.com/FSdk7kE.png" width="250">


## Use

#### ButtonWheel

`init?(coder aDecoder: NSCoder)` or `override init(frame: CGRect) `

ButtonWheel inherits from UIView. It can be instantiated either in storyboard or programmatically with the methods above from its superclass.

`func setupWith(buttonPieces : [ButtonPiece], middleRadius : MiddleRadiusSize)`

A setup function that must be called after initialization to build the view according to how it should look. The `middleRadius` parameter controls how big the hole in the middle of the wheel will be. `MiddleRadiusSize` is an enum with the cases `.small`, `.medium`, and `.large`. `buttonPieces` takes in an array of `ButtonPiece` which is a type that we will use to construct each section of the ButtonWheel.

#### ButtonWheelDelegate


`func didTapButtonWheelAtName(name : String)`

This is the function that will be called in the ButtonWheel's delegate to handle the buttons being pressed. The parameter passed into the function will be the name that you assigned to the tapped button.

#### ButtonPiece

`init(name : String, color : UIColor, centerOffset : CGPoint)`

Each ButtonPiece must be given a name, which will correspond to the label if you decide to add one using `setLabel(...)`. The name will also match the name that is passed into `didTapButtonWheelAtName(name : String)` when it is called in the ButtonWheel's delegate. The `color` parameter is going to be the background color for the button, and `centerOffset` will allow the user to move the image and label from its default position on the ButtonPiece.

`func setImage(image: UIImage, imageViewSize : CGSize, tintColor : UIColor?)`

This sets an image, which will appear on the ButtonPiece when the ButtonWheel is set up with that piece. The parameters correspond respectively to the image itself, the size you want to set for it, and the tint color for the image. If you don't want to have a tint color, you can set this parameter to `nil`. Calling this after `setLabel(...)` won't replace the label, instead it will add the image along with the label.

`func setLabel(maxLabelWidth : CGFloat, labelFont : UIFont, textColor : UIColor)`

This sets a label, which will appear on the ButtonPiece when the ButtonWheel is set up with that piece. The parameters respectively correspond to the maximum width the label should have, the font for the label, and the label's text color. Calling this after `setImage(...)` won't replace the image, instead it will add the label along with the image.

