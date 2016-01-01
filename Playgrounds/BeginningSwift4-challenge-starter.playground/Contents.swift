/*:
#### Beginning Swift Video Tutorial Series - raywenderlich.com
#### Video 4: Functions Challenge

**Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.

In this challenge, you'll do a little more refactoring to break things up into functions. It's a good idea to keep functions short and doing one thing only. That makes things easy to understand and test.
*/
import Cocoa
/*:
You'll notice the function `calculateTipOnTotal` below does two things: it figures out the tip percentage, and then calculates the tip. However, it's possible you might want just the percentage without doing the calculation, maybe to display to the user.

Here's the challenge: create a separate function with the following signature:

`func tipPercentageForRating(rating: Int) -> Double`

Given a rating, it should then return the tip percentage. Then you can update `calculateTipOnTotal` below to call that function to get the tip percentage.

When you're done, scroll down to the bottom of the file for one more challenge.
*/
func calculateTipOnTotal(totalBill: Double, withRating rating: Int) -> Double {
  let tipPercentage: Double

  if rating == 5 {
    tipPercentage = 0.25
  } else if rating >= 3 {
    tipPercentage = 0.15
  } else {
    tipPercentage = 0.10
  }

  return totalBill * tipPercentage
}

func showTipAdvice(restaurantTotal restaurantTotal: Double, withRating rating: Int) {
    let tip = calculateTipOnTotal(restaurantTotal, withRating: rating)
    print("I'd recommend $\(tip) as a tip.")
}



showTipAdvice(restaurantTotal: 95, withRating: 3)

/*:
The calculation should work as before, but there's no nice printout anymore. Here's the final challenge: add one more function with the following signature:

`func showTipAdvice(restaurantTotal restaurantTotal: Double, rating: Int)`

Given a total and a rating, it should not only calculate the tip and total to pay, but also `print()` it out nicely formatted.

To test, be sure to try calling your function with something like this:

`showTipAdvice(restaurantTotal: 49, rating: 5)`

Good luck! Check out the challenge solution playground if you need some hints.
*/

// add your code here!
