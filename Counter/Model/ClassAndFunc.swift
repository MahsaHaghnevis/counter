//
//  ClassAndFunc.swift
//  Counter
//
//  Created by Mahsa on 7/29/24.
//

import Foundation


class Logic {
    private (set) var Countnumber : Int = 0
    private var CountState : [Int] = [ 1 , 2, 5 , 10 ] //available step values
    private (set) var Step  = 1       //the step value
    private var index = 0           //keeping track of step

    func ChangeSpeed(){ //in case use hit the step button
        
        index=(index + 1)%4   //to handle return to head after hitting the tail
        Step = CountState[index]
    }
    
    func Increase(){
        Countnumber += Step
    }
    func Decreasee(){
        Countnumber -= Step
    }
    
    func Reset(){
        Countnumber = 0
    }
    
}







