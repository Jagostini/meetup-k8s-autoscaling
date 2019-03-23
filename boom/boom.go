package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/boom", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Boom")
		go func() {
			for true {
			}
		}()
	})

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "OK")
	})

	http.ListenAndServe(":8080", nil)
}
