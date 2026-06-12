// r/dailyprogrammer [easy] challenge #2
/*
Hello, coders! An important part of programming is being able to apply your programs, so your challenge for today is to create a 
calculator application that has use in your life. It might be an interest calculator, or it might be something that you can use in the
classroom. For example, if you were in physics class, you might want to make a F = M * A calc.

EXTRA CREDIT: make the calculator have multiple functions! Not only should it be able to calculate F = M * A, but also A = F/M, and M = F/A!
*/

// Not sure if it's useful or a calc but I'm goint to make a item generator that can also merge items
package dpe2 

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	fmt.println(`"G" to generate item.`)
	fmt.println(`"M" to generate two items and merge them.`)
	fmt.println(`"q" to exit application.`)
	for {	
		input : string = read_input()
		if input == "G" {
			fmt.println("Generating Item!")
			item := generate_item()
		} else if input == "M" {
			fmt.println("Generation Items and Merging!")
			item := merge_item()
		} else if input == "q" {
			os.exit(0)
		} else {
			fmt.println(`"G", "M" or "q" are the only valid inputs.`)
		}
	}
}

read_input :: proc() -> string {
	buf: [256]byte
	name, err := os.read(os.stdin, buf[:])
	if err != nil {
		fmt.eprintln("Error reading: ", err)
		return "error"
	}

	str := string(buf[:name - 1])
	return strings.clone(str)
}