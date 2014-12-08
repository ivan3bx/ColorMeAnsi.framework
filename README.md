## Color Me ANSI

This is a tiny framework for wrapping text in ANSI escape codes, suitable for providing rudimentary colorized output for use by command-line apps, or logging on the console.  This essentially adds a few extension methods to String which handles the Unicode equivalent control sequences.

### Sample usage

    // input
    "Give Me Red".colorize(.Color.RED)
    
	// output
    "\u{001B}[0;31mGive Me Red\u{001B}[0m"


An alternate usage (not recommended) will take a format-like string, and perform substitutions:

    // input
    "{RED}%@{GREEN}%@{BLUE}%@", "Give Me Red", "Give Me Green", "Give Me Blue"
	
	// output
    "\u{001B}[0;31mGive Me Red\u{001B}[0;32mGive Me Green\u{001B}[0;34mGive me Blue\u{001B}[0m"

See the testcases in <code>ColorMeAnsiTests.swift</code> for examples.

### Status
- Proof of concept in Swift (not tested in all terminal emulators obviously!)
- Interpolated format is slow, but works for Strings

### Future
- Optimize interpolated format; support things other than Strings
- Provide a way to configure colorization if it's not needed
- Support background colors