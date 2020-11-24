package docker

import (
	"fmt"

	godocker "github.com/fsouza/go-dockerclient"
	"github.com/hahwul/backbomb/pkg/printing"
)

// Init is docker init func
func Init() {
	client, err := godocker.NewClientFromEnv()
	if err != nil {
		panic(err)
	}

	opt := godocker.CreateVolumeOptions{
		Name: "backbomb",
	}
	v, err := client.CreateVolume(opt)
	printing.ErrorCheck(err)
	fmt.Println(v)

}
