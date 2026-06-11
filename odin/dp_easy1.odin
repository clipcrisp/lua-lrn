// r/dailyprogrammer [easy] challenge #1
package learning

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