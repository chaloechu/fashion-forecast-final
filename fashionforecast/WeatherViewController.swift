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
    
    var forecasts: [Forecast] = []
    
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
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
