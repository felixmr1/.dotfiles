package main

import "os/exec"

func main() {

    // Query existing layout
    cmd, _ := exec.Command("setxkbmap", "-query").Output()

    // Retrieve the language, cant figure out a better way
    lang   := string(cmd[len(cmd)-3:len(cmd)-1])

    // Switch to the other language
    var newLang []byte

    switch lang {
      case "se": newLang = []byte("gb")
      case "gb": newLang = []byte("se")
    }

    exec.Command("setxkbmap", "-layout", string(newLang)).Output()
}
