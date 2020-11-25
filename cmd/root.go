package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"os"

	printing "github.com/hahwul/backbomb/pkg/printing"
	homedir "github.com/mitchellh/go-homedir"
	"github.com/spf13/viper"
)

var cfgFile string

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "backbomb",
	Short: "Dockerized penetration-testing/bugbounty/app-sec testing environment",
	Long: `Dockerized penetration-testing/bugbounty/app-sec testing environment
	Cool Guys Don't Look At Explosions 😎💣`,
}

// Execute is execute
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(initConfig)
	printing.Banner()
	rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "config file (default is $HOME/.backbomb.yaml)")

}

// initConfig reads in config file and ENV variables if set.
func initConfig() {
	if cfgFile != "" {
		// Use config file from the flag.
		viper.SetConfigFile(cfgFile)
	} else {
		// Find home directory.
		home, err := homedir.Dir()
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}

		// Search config in home directory with name ".backbomb" (without extension).
		viper.AddConfigPath(home)
		viper.SetConfigName(".backbomb")
	}

	viper.AutomaticEnv() // read in environment variables that match

	// If a config file is found, read it in.
	if err := viper.ReadInConfig(); err == nil {
		fmt.Println("Using config file:", viper.ConfigFileUsed())
	}
}
