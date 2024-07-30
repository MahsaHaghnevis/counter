//
//  ClassAndFunc.swift
//  Counter
//
//  Created by Mahsa on 7/29/24.
//

import Foundation

class Logic {
    
    private (set) var Countnumber : Int = 0
    
    //available step values
    private var CountState : [Int] = [ 1, 2, 5 ]
    
    //the step value
    private (set) var Step  = 1
    //keeping track of step
    private var index = 0
    private (set) var IsLocked : Bool = false
    
    
    //in case use hit the step button
    func ChangeSpeed(){
        
        //to handle return to head after hitting the tail
        index=(index + 1)%3
        Step = CountState[index]
    }
    
    func Increase(){
        
        guard !IsLocked else { return }
        
        self.Countnumber += Step
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







