package printing

import (
	"fmt"

	log "github.com/sirupsen/logrus"
)

func ErrorCheck(e error) {
	if e != nil {
		fmt.Println(e)
	}
}

func Info(msg interface{}){
	log.Info(msg)
}

func Warn(msg interface{}){

}

func Fanic(msg interface{}){

}
