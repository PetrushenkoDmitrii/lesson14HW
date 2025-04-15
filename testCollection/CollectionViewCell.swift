import UIKit


class PhotoCell: UICollectionViewCell {
    
    static let idensifier: String = "PhotoCellID"
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let collectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(imageView)
        addSubview(collectionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
          
            
            collectionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            collectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configure(_ image: String) {
        imageView.image = UIImage(named: image)
        collectionLabel.text = image
        
        
    }
    
    override func prepareForReuse() {
      imageView.image = nil
    }
}
