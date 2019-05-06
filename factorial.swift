import Foundation

func factorial(num:Int)->Int{
   if(num==1){
       return 1;
   }
   else{
    return num*factorial(num: num-1)
   }
}

var num=4
var fac=factorial(num:num)

print("Factorial of:",num,"is",fac)
