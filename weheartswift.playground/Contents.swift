import UIKit
//Is Prime
extension Int{
    func isPrime() -> Bool{
        if self <= 3{
            return self > 1
        }
        else if self % 2 == 0 || self % 3 == 0{
            return false
        }
        var i = 5

        while i * i <= self {
            if self % i == 0 || self % (i + 2) == 0{
                return false
            }
        i = i + 6
        }
    return true

    }
}
let chislo = 104761
chislo.isPrime()
//

// largest prime to check
func largestPrime(){
    let max = 2000000
    var primes = [Bool](repeating: true, count: max - 2)

    var sum = 0

    for primeIndex in primes.indices
      where primes[primeIndex] == true {

      let prime = 2 + primeIndex - primes.startIndex
      sum += prime
      guard prime * 2 < max else { continue }
      for index in stride(from: primes.index(primeIndex,
                                             offsetBy: prime),
                            to: primes.endIndex,
                            by: prime) {
        primes[index] = false
      }
    }

    print(sum)
}
largestPrime()
//

//Fox and Snake
func snake(rows: Int, columns: Int){
    var toPrint: String = ""

    if rows >= 3 && rows % 2 != 0 && columns > 0{
        for r in 1...rows{
            for c in 1...columns{
                var down: Bool = false
                if r % 2 == 1{
                    down = true
                }
                else{
                    if (r % 4) == 2{down = (c == columns)}
                    if (r % 4) == 0{down = (c == 1)}
                }
                if down{
                    toPrint += "#"
                }
                else{
                    toPrint += "."
                }

            }
            print(toPrint)
            toPrint = ""
        }
    }
    else{
        print("Input rows not divisible by 2 and column above 0")
    }
}
snake(rows: 5, columns: 4)
//

//"Multiples of 3 and 5"
func multi(){
    var sum: Int = 0
    for i in 1...999{
        if i % 3 == 0 && i % 5 == 0 {
            sum += i
            continue
        }
        if i % 3 == 0 { sum += i }
        if i % 5 == 0 { sum += i }
    }
    print(sum)
}
multi()
//

//Max prime factor
var maxPrimeFactor: Int = 0
func maxPrime(number: Int){

    if number > 0{
        var maxPrime: Int = number
        var i: Int = 2
        while maxPrime > i {
            if maxPrime % i == 0{
                maxPrime = maxPrime / i
                i = 2
            }
            else{
                i += 1
            }
        }
        print(maxPrime)
    }
}
maxPrime(number: 600851475143)
//

//Euclid's algorithm
extension Int{
    static func gcd(_ first: Int, _ second: Int) -> Int {
        if first == 0 {return second}
        return gcd(second % first, first)
    }
}
Int.gcd(40,10)
//

//10001st prime
func prime1001(){
    var counter = 0
    var i = 1
    while counter <= 9999{
        i += 2
        if i.isPrime() {
            counter += 1
        }
    }

    print(i)

}
prime1001()
//

//LargestPalindrome
extension Int{

    static func largestPalindrome(_ number: Int) -> Int
    {
        var upLimit: Int = 0;

        for _ in 1...number
        {
            upLimit *= 10;
            upLimit += 9;
        }

        let lowLimit = 1 + upLimit / 10;
        var maxProduct = 0;

        for  i in (lowLimit...upLimit).reversed()
        {
            for r  in (lowLimit...upLimit).reversed()
            {
                // calculating product of two
                // n-digit numbers
                let product = i * r;
                if product < maxProduct{
                    break;
                }
                var number = product;
                var reverse = 0;

                while number != 0
                {
                    reverse = reverse * 10 + number % 10;
                    number /= 10;
                }

                // update new product if exist and if
                // greater than previous one
                if product == reverse && product > maxProduct{
                    maxProduct = product;
                }
            }
        }
        return maxProduct;
    }
}
Int.largestPalindrome(3)
//

//Special Pythagorean triplet
func getSpecialPythagoreanTriplet(sum:Int) -> Int {
    var a: Int = 1
    while a <= (sum - 3)/3{
        var b = a + 1
        while b <= (sum-1-a)/2{
            let c = sum - a - b
            if a*a + b*b == c*c {
                return a*b*c
            }
            b += 1
        }
        a += 1
    }
    return -1
}
 func getSpecialPrint() {
    let number = getSpecialPythagoreanTriplet(sum: 1000)
     print(number)
 }
getSpecialPrint()
//

//Sum square Difference
func sumSquare(upper : Int) -> Int {
    var summed = 0
    var squaredSummed = 0
    for i in 1 ... upper {
        summed += i
        squaredSummed += i * i
    }
    return summed * summed - squaredSummed
}
sumSquare(upper: 100)
//

//Even Fibonacci numbers
func fibonachi(input: Int = 4000000) -> Int {
    var output: Int = 0
    var number1: Int = 0
    var number2: Int = 2

    while number2 < input {
        output += number2
        (number1, number2) = (number2, (4 * number2) + number1)
    }

    return output
}
fibonachi()
//

//Lattice paths
func lattice(_ input: Int = 20) -> Int {
    return (1...input).reduce(1, {$0 * (input + $1) / $1})
}
lattice()
//

//Power Digit Sum
func powerDigit(_ input: Int = 1_000) -> Int {
    var carryOver: UInt8 = 0
    var digits: [UInt8] = [1]

    for _ in 1...input {
        for index in 0..<digits.endIndex {
            digits[index] = (digits[index] * 2) + carryOver
            if digits[index] >= 10 {
                digits[index] -= 10
                carryOver = 1
            } else {
                carryOver = 0
            }
        }
        if carryOver > 0 {
            digits.append(carryOver)
            carryOver = 0
        }
    }

    return digits.reduce(0, {$0 + Int($1)})
}
powerDigit()
//
