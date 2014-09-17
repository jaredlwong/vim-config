package main

import (
	"os"
	"fmt"
	"path/filepath"
	"os/exec"
	"strings"
	"io"
)

func symlink(src string, dst string) {
	fi, err := os.Lstat(dst)

	// check if dst already points to src
	if err == nil {
		if fi.Mode() & os.ModeSymlink == os.ModeSymlink {
			lsrc, lerr := os.Readlink(dst)
			if lerr != nil {
				panic(lerr)
			}
			// if link already in place, cotinue
			if lsrc == src {
				return
			}
		}
		panic(fmt.Sprintf("File exists %s and does not point to %s." +
				" Please remove it.", dst, src))
	}

	// make sure dst doesn't exist
	if err.(*os.PathError).Err.Error() != "no such file or directory" {
		panic(fmt.Sprintf(fmt.Sprintf("Failed to handle stat of dst" +
				" %s. You may need to remove it: %s",
				dst, err)))
	}

	// make sure src exists
	_, err = os.Lstat(src)
	if err != nil {
		panic(fmt.Sprintf(fmt.Sprintf("Failed to stat src %s. %s",
				src, err)))
	}

	// symlink dst to src
	err = os.Symlink(src, dst)
	if err != nil {
		panic(fmt.Sprintf(fmt.Sprintf("Failed to symlink %s->%s. %s",
				dst, src, err)))
	}
}

func execCmd(cmds string) {
	fmt.Println(cmds)
	cmdp := strings.Split(cmds, " ")
	cmd := exec.Command(cmdp[0], cmdp[1:]...)
	stdout, err := cmd.StdoutPipe()
	if err != nil {
		panic(err)
	}
	stderr, err := cmd.StderrPipe()
	if err != nil {
		panic(err)
	}
	err = cmd.Start()
	if err != nil {
		panic(err)
	}
	go io.Copy(os.Stdout, stdout) 
	go io.Copy(os.Stderr, stderr) 
	cmd.Wait()
}

// requires dotfile path, home path
func installVim(dp string, hp string) {
	src1 := filepath.Join(dp, ".vim")
	dst1 := filepath.Join(hp, ".vim")
	symlink(src1, dst1)

	src2 := filepath.Join(dp, ".vimrc")
	dst2 := filepath.Join(hp, ".vimrc")
	symlink(src2, dst2)

	_, err := os.Lstat(filepath.Join(dp, ".vim", "bundle", "vundle"))
	if err == nil {
		fmt.Printf("Skipping vundle clone because" +
				" .vim/bundle/vundle exists\n")
		goto vundle_init
	}
	if err.(*os.PathError).Err.Error() != "no such file or directory" {
		panic(fmt.Sprintf("Failed to handle stat of" +
				".vim/bundle/vundle %s.", err))
	}
	execCmd("git clone https://github.com/gmarik/vundle.git " +
			filepath.Join(dp, ".vim/bundle/vundle"))

vundle_init:
	execCmd("vim +BundleInstall +qall")
}

func main() {
	hp := os.Getenv("HOME")
	if hp == "" {
		panic("HOME environment variable is not set")
	}
	dp := os.Getenv("DOTFILES")
	if dp == "" {
		var err error
		dp, err = os.Getwd()
		if err != nil {
			fmt.Printf("Error in os.Getwd")
			os.Exit(1)
		}
	}
	installVim(dp, hp)
}
