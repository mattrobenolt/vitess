package main

import (
	"fmt"
	"io/fs"
	"os"
)

func main() {
	fsys := os.DirFS("examples/local/vtdataroot/")
	fs.WalkDir(fsys, ".", func(p string, d fs.DirEntry, err error) error {
		info, err := d.Info()
		if err != nil {
			return err
		}
		fmt.Printf("%v\t%v\t%v\n", p, info.Mode(), int(info.Mode()))
		return nil
	})
}
