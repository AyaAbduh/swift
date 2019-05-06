import Foundation

func swap(num1: inout Int,num2: inout Int){
    print("Hello From swap Function")
    var temp=num1
    num1=num2
    num2=temp
}

var num1=5;
var num2=6;

print("before swap -> num1:",num1,"num2:",num2)

swap(&num1,&num2)

print("after swap-> num1:",num1,"num2:",num2)
