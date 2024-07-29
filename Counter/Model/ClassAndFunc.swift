//
//  ClassAndFunc.swift
//  Counter
//
//  Created by Mahsa on 7/29/24.
//

import Foundation


class Logic {
    private (set) var Countnumber : Int = 0
    private var CountState : [Int] = [ 1, 2, 5 ] //available step values
    private (set) var Step  = 1       //the step value
    private var index = 0           //keeping track of step
    private (set) var IsLocked : Bool = false //
    func ChangeSpeed(){ //in case use hit the step button
        
        index=(index + 1)%3  //to handle return to head after hitting the tail
        Step = CountState[index]
    }
    
    func Increase(){
        if IsLocked != true {
            Countnumber += Step
        }
    }
    func Decreasee(){
        if IsLocked != true {
            Countnumber -= Step
        }
    }
    
    func Reset(){
        Countnumber = 0
    }
    
    func Lock(){
        IsLocked=true
    }
    
    func UnLock(){
        IsLocked=false
    }
    
}







