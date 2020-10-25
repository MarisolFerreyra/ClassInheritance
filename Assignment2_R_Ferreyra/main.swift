//
//  main.swift
//  Assignment2_R_Ferreyra
//
//  Created by Rebecca Ferreyra on 10/23/20.
//

import Foundation



class StaffMember {
    // Stored Properties
    var name: String
    var emailAddress: String
    // Initializers
    init () {
        name = ""
        emailAddress = ""
    }
    init (name: String, emailAddress: String) {
        self.name = name
        self.emailAddress = emailAddress
    }
    // Methods
    func calcPay () -> Double {
        return 0
    }
    func displayStaffMember () -> String {
        return "\(name)\t\t$\(calcPay())"
    }
}
class Volunteer: StaffMember {
    // Stored Property
    var hours: Int
    // Initializers
    override init () {
        hours = 0
        super.init()
    }
    init(hours: Int, name: String, emailAddress: String) {
        self.hours = hours
        super.init(name: name, emailAddress: emailAddress)
    }
    // Methods
    override func calcPay() -> Double {
        return 0
    }
    override func displayStaffMember() -> String {
        return "Volunteer\t\t" + super.displayStaffMember()
    }
}
class Employee: StaffMember {
    // Stored Property
    var payRate: Double
    // Initializers
    override init () {
        payRate = 0
        super.init()
    }
    init(payRate: Double, name: String, emailAddress: String) {
        self.payRate = payRate
        super.init(name: name, emailAddress: emailAddress)
    }
    //  Methods
    override func calcPay() -> Double {
        return 0
    }
}
class Executive: Employee {
    // Stored Property
    var netProfit: Double
    // Initializers
    override init () {
        netProfit = 0
        super.init()
    }
    init (netProfit: Double, payRate: Double, name: String, emailAddress: String) {
        self.netProfit = netProfit
        super.init(payRate: payRate, name: name, emailAddress: emailAddress)
    }
    // Methods
    override func calcPay() -> Double {
        var bonus: Double
        if netProfit > 30000 {
            bonus = netProfit * 0.03
        }
        else if netProfit > 5000 && netProfit < 30000 {
            bonus = netProfit * 0.01
        }
        else {
            bonus = 0
        }
        return payRate + bonus
    }
    override func displayStaffMember() -> String {
        return "Executive\t\t" + super.displayStaffMember()
    }
}
class Hourly: Employee {
    // Stored Property
    var hoursWorked: Double
    // Initializers
    override init() {
        hoursWorked = 0
        super.init()
    }
    init (hoursWorked: Double, payRate: Double, name: String, emailAddress: String) {
        self.hoursWorked = hoursWorked
        super.init(payRate: payRate, name: name, emailAddress: emailAddress)
    }
    // Methods
    override func calcPay() -> Double {
        var overTimePay: Double
        var overTimeHours: Double
        var regularPay: Double
        if hoursWorked > 40 {
            overTimeHours = hoursWorked - 40
        }
        else {
            overTimeHours = 0
        }
        overTimePay = payRate * overTimeHours * 1.5
        regularPay = payRate * (hoursWorked - overTimeHours)
        return regularPay + overTimePay
    }
    override func displayStaffMember() -> String {
        return "HourlyEmp\t\t" + super.displayStaffMember()
    }
}
// Function in the Program
func calcTotalPay(staffs:[StaffMember]) -> Double {
    var total: Double = 0
    for s in staffs {
        total += s.calcPay()
    }
    return total
}

var JohnSmith = Volunteer(hours: 10, name: "John Smith", emailAddress: "johnsmith@abc.com")
var JoshMiller = Hourly (hoursWorked: 45, payRate: 25.0, name: "Josh Miller", emailAddress: "joshmiller@abc.com")
var MaryJones = Executive (netProfit: 100000, payRate: 3000, name: "Mary Jones", emailAddress: "maryjones@abc.com")

var staffList: [StaffMember] = [JohnSmith, MaryJones, JoshMiller]

print("Employee type \t Employee Name \t Weekly pay ")
for staff in staffList {
    print(staff.displayStaffMember())
}
