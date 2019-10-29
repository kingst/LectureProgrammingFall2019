import UIKit

let image = UIImage()
let rect = CGRect(x: 0.0, y: 0.5, width: 10, height: 10)

// this is how to crop a UIImage backed by a cgImage and a ciImage
let cgImage = image.cgImage?.cropping(to: rect).flatMap { UIImage(cgImage: $0) }
let ciImage = (image.ciImage?.cropped(to: rect)).flatMap { UIImage(ciImage: $0) }

extension UIImage {
    func crop(to: CGRect) -> UIImage? {
        switch (self.cgImage, self.ciImage) {
        case (.some(let cgImage), nil):
            return cgImage.cropping(to: to).flatMap { UIImage(cgImage: $0) }
        case (nil, .some(let ciImage)):
            return UIImage(ciImage: ciImage.cropped(to: to))
        default:
            print("unexpected UIImage state")
            return nil
        }
    }
}

let croppedImage = image.crop(to: rect)
