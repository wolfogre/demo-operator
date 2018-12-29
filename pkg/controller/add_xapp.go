package controller

import (
	"github.com/wolfogre/demo-operator/pkg/controller/xapp"
)

func init() {
	// AddToManagerFuncs is a list of functions to create controllers and add them to a manager.
	AddToManagerFuncs = append(AddToManagerFuncs, xapp.Add)
}
