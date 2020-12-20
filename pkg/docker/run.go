package docker

import (
	"context"
	"os/exec"
	"os"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/api/types/mount"
	"github.com/docker/docker/client"
	"github.com/hahwul/backbomb/pkg/printing"
)

// Run in running backbomb image
func Run() {
	ctx := context.Background()
	printing.Info("Starting backbomb 💣")
	cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	printing.Info("The docker client object has been created")
	printing.ErrorCheck(err)

	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "hahwul/backbomb",
		//Cmd:   []string{"--mount","source=backbomb,target=/app"},
		//-it --mount source=backbomb,target=/app
		Tty:   true,
	}, &container.HostConfig{
        Mounts: []mount.Mount{
            {
                Type:   mount.TypeVolume,
                Source: "backbomb",
                Target: "/app",
            },
        },
	},nil, "")
	if err != nil {
		printing.ErrorCheck(err)
		panic(err)
	}

	if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
	printing.Info("Container creating job successful")
	printing.Info(resp.ID)
	printing.Info("Connecting backbomb container")
	cmd := exec.Command("sh", "-c", "docker exec -it "+resp.ID+" zsh")
	cmd.Stdout = os.Stdout
	cmd.Stdin = os.Stdin
	cmd.Stderr = os.Stderr
	cmd.Run()
	cmd.Wait()
	printing.Info("Start the shutdown process.")
	cmd = exec.Command("sh", "-c", "docker kill "+resp.ID)
	cmd.Run()
	cmd.Wait()
	printing.Info("Finish")
}


