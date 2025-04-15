
import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let cities: [String] = ["barselona",
                            "dubai",
                            "la",
                            "london",
                            "newYork",
                            "paris",
                            "roma",
                            "tokyo"]
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 4
        slider.value = 2
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(slider)
        
        slider.addTarget(self, action: #selector(handleSliderValueChanged), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.idensifier)
    }
    
    @objc func handleSliderValueChanged() {
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.idensifier, for: indexPath) as?
            PhotoCell else { return UICollectionViewCell() }
        cell.configure(cities[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present(CustomVC(imageName: cities[indexPath.row]), animated: true)
    }
}

    
    extension ViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let columbs = Int(slider.value)
            let width = collectionView.frame.width / CGFloat(columbs)
            return CGSize(width: width,
                          height: width)
        }
    }
