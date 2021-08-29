import Foundation

typealias PixelPointer = UnsafePointer<UInt8>
struct Pixel
{
    static let bytesPerPixel = 4
    fileprivate let offset: Int
    fileprivate init(_ offset: Int) { self.offset = offset }
    
    static func createPixelMatrix(_ width: Int, _ height: Int) -> [[Pixel]]
    {
        return (0..<height).map { row in
            (0..<width).map { col in
                let offset = (width * row + col) * Pixel.bytesPerPixel
                return Pixel(offset)
            }
        }
    }
    
    func intensityFromPixelPointer(_ pointer: PixelPointer) -> Double
    {
        let
        red   = pointer[offset + 0],
        green = pointer[offset + 1],
        blue  = pointer[offset + 2]
        return Pixel.calculateIntensity(red, green, blue)
    }
    
    fileprivate static func calculateIntensity(_ r: UInt8, _ g: UInt8, _ b: UInt8) -> Double
    {
        let
        redWeight   = 0.229,
        greenWeight = 0.587,
        blueWeight  = 0.114,
        weightedMax = 255.0 * redWeight   +
                      255.0 * greenWeight +
                      255.0 * blueWeight,
        weightedSum = Double(r) * redWeight   +
                      Double(g) * greenWeight +
                      Double(b) * blueWeight
        return weightedSum / weightedMax
    }
}
