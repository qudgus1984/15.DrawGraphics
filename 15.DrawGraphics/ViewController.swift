//
//  ViewController.swift
//  15.DrawGraphics
//
//  Created by 이병현 on 2022/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! // 생성한 콘텍스트의 정보를 가져옴
        
        // Draw Line
        context.setLineWidth(2.0) // 이제 콘텍스트에 대한 여러 가지 설정을 함. 선의 굵기를 2.0으로 설정함.
        context.setStrokeColor(UIColor.red.cgColor) // 해당 콘텍스트의 선 색상을 설정함.
        
        context.move(to: CGPoint(x: 70, y: 50)) // 그림을 그리기 위하여 시작 위치로 커서를 이동함.
        context.addLine(to: CGPoint(x: 270, y: 250)) // 현재 위치에서 지정한 위치까지 선을 추가함.
        
        context.strokePath() // 추가한 경로를 콘텍스트에 그림
        
        // Draw Triangle
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.strokePath() // Darw Line에서 사용한 방법으로 삼각형을 그림.
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 나타남
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200)) // XY 좌표에서 시작하고 폭이 200픽셀, 높이가 200픽셀인 사각형을 그림
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100)) // XY 좌표에서 시작하고 폭이 200픽셀, 높이가 100픽셀인 타원을 그림
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200)) // XY 좌표에서 시작하고 폭이 200픽셀, 높이가 200픽셀인 원을 그림
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        // 현재 위치에서 두 개의 접점 사이에 내접하는 반지름이 50인 호를 그리겠다는 의미
        context.move(to: CGPoint(x: 100, y: 200))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200)) // XY 좌표에서 시작하고 폭이 200픽셀, 높이가 200픽셀인 사각형을 그림
        context.strokePath()
    }
    
}

