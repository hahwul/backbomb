package docker

import (
	"context"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
	printing "github.com/hahwul/backbomb/pkg/printing"
)

// PullingLatestImage is docker pulling func
func PullingLatestImage() {
	printing.Info("Pulling.. backbomb image")

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
