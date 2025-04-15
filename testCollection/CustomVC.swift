



import UIKit


class CustomVC: UIViewController {
    
    let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text =  ""
        label.textColor = .label
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        view.backgroundColor = .white
    }
    func setupUI() {
        view.addSubview(cityImageView)
        view.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cityImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cityImageView.heightAnchor.constraint(equalToConstant: 300),
            
            cityLabel.topAnchor.constraint(equalTo: cityImageView.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func configure(with imageName: String) {
        cityImageView.image = UIImage(named: imageName)
        cityLabel.text = imageName
    }
    
    
    init(imageName: String) {
        super.init(nibName: nil, bundle: nil)
        configure(with: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

