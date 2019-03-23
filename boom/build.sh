GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build boom.go
docker build -t eu.gcr.io/kedare-lab/boom .
