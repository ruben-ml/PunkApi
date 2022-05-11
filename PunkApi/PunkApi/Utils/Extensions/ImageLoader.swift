//
//  ImageLoader.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 10/5/22.
//

import SDWebImage
import UIKit

/// Esta estructura funciona a modo de encapsulador para la librería de carga de imágenes.
struct ImageLoader {
    /// Carga la imagen de la url pasada por parámetro en el imageView pasado por parámetro.
    /// - Parameters:
    ///   - url: URL de la imagen.
    ///   - imageView: ImageView donde se quiere mostrar la imagen.
    static func loadImage(_ url: String?, in imageView: UIImageView, placeholder: UIImage? = nil) {
        if let urlString = url, let imageURL = URL(string: urlString) {
            loadImage(imageURL, in: imageView, placeholder: placeholder)
        } else {
            imageView.image = placeholder
        }
    }

    /// Carga la imagen de la url pasada por parámetro en el imageView pasado por parámetro.
    /// - Parameters:
    ///   - url: URL de la imagen.
    ///   - imageView: ImageView donde se quiere mostrar la imagen.
    static func loadImage(_ url: URL?, in imageView: UIImageView, placeholder: UIImage? = nil) {
        imageView.sd_setImage(with: url, placeholderImage: placeholder, options: [.progressiveLoad]) { image, _, _, _ in
            if let image = image {
                imageView.image = image
            } else {
                imageView.image = placeholder
            }
        }
    }

    static func loadImage(at url: URL, completionHandler: @escaping (UIImage?) -> Void) {
        SDWebImageManager.shared.loadImage(with: url,
                                           options: .continueInBackground, progress: nil) { image, _, _, _, _, _ in
            completionHandler(image)
        }
    }
}
