import Foundation

func sortArray(array:[Int]) -> [Int] {
    var arr=array
    print("UnSorted Array",arr)
    // for (index, num) in arr.enumerated() {
    //     print(index,num)
    // }
   for j in 0 ..< arr.count{
        for index in 0 ..< arr.count-1{
            if(arr[index] > arr[index+1]){
                var temp = arr[index]
                arr[index] = arr[index+1]
                arr[index+1] = temp
            }
        }
   }
    return arr
}
var numArray=[1,2,3,4,7,0]
var arr=sortArray(array:numArray)
print("sorted Array",arr)
 