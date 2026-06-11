// r/dailyprogrammer [easy] challenge #1
/*
create a program that will ask the users name, age, and reddit username. have it tell them the information back, in the format:

your name is (blank), you are (blank) years old, and your username is (blank)
for extra credit, have the program log this information in a file to be accessed later.
*/
package dpe1

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	fmt.println("Please enter your name:")
	name : string = readinput() 
	fmt.println("Please enter your age:")
	age : string = readinput() 
	fmt.println("Please enter your username:")
	username : string = readinput() 
	fmt.println(age)

	fmt.printfln("Your name is %s, you are %s years old and your username is %s.", name, age, username)
}

readinput :: proc() -> string {
	buf: [256]byte
	name, err := os.read(os.stdin, buf[:])
	if err != nil {
		fmt.eprintln("Error reading: ", err)
		return "error"
	}

	// ? minus 1 to remove \n, assuming that's just because you hit
	// ? return to send the input?
	str := string(buf[:name - 1])
	return strings.clone(str)
}