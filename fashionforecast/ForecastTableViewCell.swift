//
//  ForecastTableViewCell.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/21/21.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    var dayLabel = UILabel()
    var temperatureLabel = UILabel()
    var weather = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 187/255, green: 227/255, blue: 255/255, alpha: 0.8)
        
        dayLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        dayLabel.textColor = .black
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayLabel)
        
        temperatureLabel.font = .systemFont(ofSize: 65, weight: .regular)
        temperatureLabel.textColor = .black
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(temperatureLabel)
        
        weather.contentMode = .scaleAspectFit
        weather.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weather)
        
        setUpConstraints()
    }
    
    func configure(forecast: Forecast){
        dayLabel.text = forecast.dayOfWeek
        temperatureLabel.text = forecast.temperature + "\u{00B0} F"
        weather.image = UIImage(named: forecast.weather)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dayLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            temperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            weather.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            weather.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 10),
            weather.heightAnchor.constraint(equalToConstant: 80),
            weather.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
