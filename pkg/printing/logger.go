package printing

import (
	"fmt"

	log "github.com/sirupsen/logrus"
)

// ErrorCheck is checking error
func ErrorCheck(e error) {
	if e != nil {
		fmt.Println(e)
	}
}

// Info is logger
func Info(msg interface{}){
	log.Info(msg)
}

// Warn is logger
func Warn(msg interface{}){

}

// Fanic is logger
func Fanic(msg interface{}){

}
