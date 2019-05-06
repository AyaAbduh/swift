import Foundation

func callMinAndMax(array : [Int])->(min:Int ,max:Int){
    print("Hello From MinMax Function")
    var max=array[0]
    var min=array[0]
    for value in array[1..<array.count]{
        if(value<min){
            min=value
        }
       else  if(value>max){
            max=value
         }
    }
    return (min,max)
}

var tuble=callMinAndMax(array:[1,2,3,4,7,0])
print("min:",tuble.min,"max:",tuble.max)
