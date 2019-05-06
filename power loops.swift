import Foundation

func calculatePower(power:Int,base:Int)->Int{
  var result=1
  for _ in 1...power{
      result *= base;
  } 
    return result
}
var pow=6
var base=2
var result = calculatePower(power:pow,base:base)
print(base," power",pow," is ",result)