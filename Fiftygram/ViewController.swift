//
//  ViewController.swift
//  Fiftygram
//
//  Created by Edward White on 7/12/20.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let context = CIContext()
    var original: UIImage?
    var filterImage: UIImage?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sepiaButton: filterButton!
    @IBOutlet var noirButton: filterButton!
    @IBOutlet var vintageButton: filterButton!
    @IBOutlet var instantButton: filterButton!
    @IBOutlet var saveButton:filterButton!
    

    @IBAction func choosePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
                
            }
        }
    
    @IBAction func applySepia() {
        if original == nil {
            return
        }
        
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        display(filter: filter!)

    }
    
    @IBAction func applyNoir() {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
    }
    
    @IBAction func applyVintage() {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    @IBAction func applyInstant(){
        if original == nil {
            return
        }
        let filter = CIFilter(name: "CIPhotoEffectInstant")
        display(filter: filter!)
    }
    
    @IBAction func savePhoto() {
        if original == nil {
            return
        }        
        UIImageWriteToSavedPhotosAlbum((filterImage)!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func display(filter: CIFilter) {
        filter.setValue(CIImage(image:original!),forKey: kCIInputImageKey)
        let output = filter.outputImage
        imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
        filterImage = imageView.image
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image =
            info[UIImagePickerController.InfoKey.originalImage]
            as? UIImage {
            imageView.image = image
            original = image
        }
    }
    
    }

