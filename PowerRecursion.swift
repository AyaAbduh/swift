import Foundation

func calculatePower(power:Int,base:Int)->Int{
    if(power==0){
        return 1;
    }
    else{
        return base * calculatePower(power:power-1,base:base)
    }

}
var pow=6
var base=2
var result = calculatePower(power:pow,base:base)
print(base," power",pow," is ",result)