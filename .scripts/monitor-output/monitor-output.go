package main

import (
  "os/exec"
//  "strings"
  "fmt"
  "os"
)

func main() {

    choice := os.Args[1]

// stopped working..
//    cmd := "xrandr | grep -w connected"
//    out, err := exec.Command("bash","-c",cmd).Output()
//    if err != nil {
//            print("Failed to execute command: " + cmd)
//    }
//
//    // get connected monitor
//    parts := strings.Split(string(out), " ")
//    laptopMonitor := []byte(parts[0])
//
//    // remove first line from out
//    parts2 := strings.Split(string(out), "\n")
//    out = []byte(parts2[1])
//
//    // get connected monitor
//    parts3 := strings.Split(string(out), " ")
//    connectedMonitor := []byte(parts3[0])

    laptopMonitor := "eDP-1"
    connectedMonitor := "HDMI-2"


    var cmd2 string
    switch choice {
        case "mirror":
          cmd2 = fmt.Sprintf(
            "xrandr --output %s --same-as %s", connectedMonitor,
            laptopMonitor)
        case "extend":
          cmd2 = fmt.Sprintf(
            "xrandr --output %s --right-of %s", connectedMonitor,
            laptopMonitor)
    }
    exec.Command("bash","-c",cmd2).Output()
}

