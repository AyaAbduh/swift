//
//  Manager.swift
//  lab1
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import Foundation
class Managers :Person{
    override func getSalary(salary:String)->String{
        let salary = Double(salary)
        let EmpSalary = String (salary! * 100)
        return EmpSalary
    }
}
