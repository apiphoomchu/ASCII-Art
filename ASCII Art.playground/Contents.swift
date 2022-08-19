/*:
# What is ASCII Art??
 ASCII art is a graphic design technique that uses computers for presentation and consists of pictures pieced together from the 95 printable (from a total of 128) characters defined by the ASCII Standard from 1963 and ASCII compliant character sets with proprietary extended characters (beyond the 128 characters of standard 7-bit ASCII). The term is also loosely used to refer to text based visual art in general. ASCII art can be created with any text editor, and is often used with free-form languages. Most examples of ASCII art require a fixed-width font (non-proportional fonts, as on a traditional typewriter) such as Courier for presentation.
 - - -
 */
/*:
# How to run this ASCII Art Playground?
 * 1). Pick your image 🌁
 * 2). toggle off **Results** & **Show Console** in the **Performance Panel** ⏱ located at the bottom of the screen, to the left of the Swift Playground Run/Stop Button.
 * 3). That's it!  😙

 - - -
 */
let image = #imageLiteral(resourceName: "") //👈 Pick your image here!
/*:
 - Important:
    To run a program, make sure to toggle off **Results** & **Show Console** in the **Performance Panel** ⏱ located at the bottom of the screen, to the left of the Swift Playground Run/Stop Button.
 */
//This playground was inspired by an article about ASCII Art written by Josh Smith in 2015.


import UIKit
import PlaygroundSupport

var currentLabel: UILabel?
let labelFont = UIFont(name: "Menlo", size: 7)!
let maxImageSize = CGSize(width: 310, height: 310)
var palette: AsciiPalette = AsciiPalette(font: labelFont)
var scrollView = UIScrollView()

func displayImage(_ image: UIImage)
    {
            
            let
            rotatedImage = image.imageRotatedToPortraitOrientation(),
            resizedImage = rotatedImage.imageConstrainedToMaxSize(maxImageSize),
            asciiArtist  = AsciiArtist(resizedImage, palette),
            asciiArt     = asciiArtist.createAsciiArt()
            displayAsciiArt(asciiArt)
        
    }


func displayAsciiArt(_ asciiArt: String)
    {
        let label = UILabel()
        label.font = labelFont
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.numberOfLines = 0
        label.text = asciiArt
        label.setLineSpacing(lineHeightMultiple: 0.608)
        label.sizeToFit()
        
        currentLabel?.removeFromSuperview()
        currentLabel = label
        
        scrollView.addSubview(label)
        scrollView.contentSize = label.frame.size
        
        updateZoomSettings(animated: false)
        scrollView.contentOffset = CGPoint.zero
    }


func updateZoomSettings(animated: Bool)
    {
        let
        scrollSize  = scrollView.frame.size,
        contentSize = scrollView.contentSize,
        scaleWidth  = scrollSize.width / contentSize.width,
        scaleHeight = scrollSize.height / contentSize.height,
        scale       = max(scaleWidth, scaleHeight)
        scrollView.minimumZoomScale = scale
        scrollView.setZoomScale(scale, animated: animated)
    }



displayImage(image)
scrollView.backgroundColor = .black
PlaygroundPage.current.liveView = scrollView





