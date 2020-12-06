package docker

import (
	"context"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
	"github.com/docker/docker/api/types/volume"
	printing "github.com/hahwul/backbomb/pkg/printing"
)

// PullingLatestImage is docker pulling func
func PullingLatestImage() {
	printing.Info("Pulling backbomb latest image")

	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}

	reader, err := cli.ImagePull(ctx, "hahwul/backbomb", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
	_=reader
	//io.Copy(os.Stdout, reader)
}

// CreateVolume is create volume for persistant storage
func CreateVolume() {
	printing.Info("Create Volume 'backbomb' for Persistant storage")
	ctx := context.Background()
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		panic(err)
	}
	body := &volume.VolumeCreateBody{
		Name: "backbomb",
	}
	cli.VolumeCreate(ctx, *body)
}
