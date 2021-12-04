//
//  WeatherViewController.swift
//  fashionforecast
//
//  Created by Chloe Chu on 11/17/21.
//

import UIKit

class WeatherViewController: UIViewController{
    var tableView = UITableView()
    let reuseIdentifier = "weatherCellReuse"
//    let cellHeight: CGFloat = 60
    
    var imageView = UIImageView()
    var desc = UILabel()
    var temp = UILabel()
    var realFeelLabel = UILabel()
    var humidityLabel = UILabel()
    
    var button = UIButton()
    
    
    var forecasts: [Forecast] = []
    var data: DataResponse = DataResponse(weather: [], main: Temperature(temp: 0.0))
    
    init(){
        super.init(nibName: nil, bundle: nil)
        createDummyData()
    }
    
    func createDummyData(){
        let monday = Forecast(temperature: String(54), weather: "cloudy", dayOfWeek: "Monday")
        let tuesday = Forecast(temperature: String(43), weather: "rainy", dayOfWeek: "Tuesday")
        let wednesday = Forecast(temperature: String(45), weather: "sunny", dayOfWeek: "Wednesday")
        let thursday = Forecast(temperature: String(54), weather: "partly cloudy", dayOfWeek: "Thursday")
        let friday = Forecast(temperature: String(46), weather: "cloudy", dayOfWeek: "Friday")
        let saturday = Forecast(temperature: String(41), weather: "sunny", dayOfWeek: "Saturday")
        let sunday = Forecast(temperature: String(50), weather: "rainy", dayOfWeek: "Sunday")
        
        forecasts = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Weather"
        view.backgroundColor = UIColor(red: 133/255, green: 218/255, blue: 1, alpha: 1)

        button.setTitle("Get Weather", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getData), for: .touchUpInside)
        view.addSubview(button)
        
        desc.textColor = .black
        desc.font = .systemFont(ofSize: 25, weight: .regular)
        desc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(desc)
        
        temp.textColor = .black
        temp.font = .systemFont(ofSize: 25, weight: .regular)
        temp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(temp)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            temp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temp.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 600)
        ])
        NSLayoutConstraint.activate([
            desc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desc.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5)
        ])
    }

    @objc func getData(){
        NetworkManager.getWeather{ data in
            self.data = data
            self.desc.text = "Weather Description: " + data.weather[0].main
            self.temp.text = "Temperature: " + String(Int(data.main.temp * -100)) + " \u{00B0}F"
            self.imageView.image = self.getImage(str: self.desc.text ?? "")
            self.moveIt(self.imageView, 4)
        }
    }
    
    func getImage(str: String) -> UIImage{
        if(str.contains("Partly")){
            return UIImage(named: "partly cloudy")!
        }
        if(str.contains("Cloud")){
            return UIImage(named: "cloudy")!
        }
        if(str.contains("Rain") || str.contains("rain")){
            return UIImage(named: "rainy")!
        }
        if(str.contains("Sunny") || str.contains("sunny")){
            return UIImage(named: "sunny")!
        }
        return UIImage(named: "weather")!
    }
    
    //animation code taken from medium.com
    func moveIt(_ imageView: UIImageView,_ speed:CGFloat) {
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {
            imageView.frame.origin.x = self.view.frame.size.width
        }, completion: { (_) in
            imageView.frame.origin.x = -imageView.frame.size.width
            self.moveIt(imageView,speeds)
        })
    }
}

extension WeatherViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ForecastTableViewCell{
            let forecast = forecasts[indexPath.row]
            cell.configure(forecast: forecast)
            cell.selectionStyle = .none
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
}

extension WeatherViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
