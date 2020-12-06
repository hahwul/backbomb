package docker

import (
	printing "github.com/hahwul/backbomb/pkg/printing"
)

// Init is docker init func
func Update() {
	printing.Info("Start update image to latest")
	PullingLatestImage()
}
