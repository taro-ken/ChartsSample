//
//  ViewController.swift
//  ChartsSample
//
//  Created by 木元健太郎 on 2021/12/18.
//

import UIKit
import Charts

class ChartVC: UIViewController,ChartViewDelegate {
    @IBOutlet weak var linechart: LineChartView!
    
    var daysList = ["09/11","09/12","09/13","09/11","09/12","09/13"]
    let unitsSold = [44.3, 44.0, 62,44.3, 44.0, 62]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linechart.delegate = self
        setLineGraph(days: daysList)
    }
    
    func setLineGraph(days:[String]){
        let data = LineChartData()
        var entry = [ChartDataEntry]()
        
        for (i,d) in unitsSold.enumerated(){
            entry.append(ChartDataEntry(x: Double(i),y: d))
        }
        
        let dataset = LineChartDataSet(entries: entry,label: "Units Sold")
        
        
        linechart.data = LineChartData(dataSet: dataset)
        // linechart.chartDescription?.text = "Item Sold Chart"
        
        let chartFormatter = LineChartFormatter(labels: days)
        let xAxis = linechart.xAxis
        xAxis.valueFormatter = chartFormatter
        xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)!
        xAxis.labelTextColor = UIColor.black
        linechart.xAxis.granularityEnabled = true
        linechart.xAxis.granularity = 1.0
        linechart.xAxis.decimals = 0
        linechart.xAxis.valueFormatter = xAxis.valueFormatter
     //   linechart.data = data
    }
    
    private class LineChartFormatter: NSObject,AxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            if labels.count == 1 {
                return labels[0]
            } else {
                return labels[Int(value)]
            }
        }
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    
}
