package main

import (
	"net/http"

	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
)

func homeHandler(w http.ResponseWriter, r *http.Request) {
	log.Info("home handler got called")
	if _, err := w.Write([]byte("welcome To Our HomePage")); err != nil {
		log.Error(err)
	}
	log.Info("Welcome To Our Homepage")
}
func main() {
	log.WithFields(log.Fields{
		"user": "admin",
	}).Info("Starting a http server that listens on port 8081")

	r := mux.NewRouter()
	r.HandleFunc("/home", homeHandler)
	if err := http.ListenAndServe(":8081", r); err != nil {
		log.Fatal(err)
	}
}
