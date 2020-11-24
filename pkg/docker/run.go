package docker

import (

	godocker "github.com/fsouza/go-dockerclient"
)

// Run in running backbomb image
func Run() {
	/*
	cmd := exec.Command("sh","-c","docker run -it --mount source=backbomb,target=/app 50148891d3d1")//hahwul/backbomb:latest")
	cmd.Start()
	cmd.Wait()
	*/
	client, err := godocker.NewClientFromEnv()
	if err != nil {
		panic(err)
	}
	conf := &godocker.HostConfig{}
	err = client.StartContainer("e1326eb16ac1",conf)
}


