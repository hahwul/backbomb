package docker

import (
	printing "github.com/hahwul/backbomb/pkg/printing"
)

// Init is docker init func
func Init() {
	printing.Info("Initialize backbomb")
	PullingLatestImage()
	CreateVolume()	
}
