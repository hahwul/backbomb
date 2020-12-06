package cmd

import (

	docker "github.com/hahwul/backbomb/pkg/docker"
	"github.com/spf13/cobra"
)

// updateCmd represents the update command
var updateCmd = &cobra.Command{
	Use:   "update",
	Short: "Update hahwul/backbomb image",
	Run: func(cmd *cobra.Command, args []string) {
		docker.Update()
	},
}

func init() {
	rootCmd.AddCommand(updateCmd)
}
