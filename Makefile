#
# Simple Makefile
#
PROJECT = datatools

VERSION = $(shell grep -m1 'Version = ' $(PROJECT).go | cut -d\"  -f 2)

BRANCH = $(shell git branch | grep '* ' | cut -d\  -f 2)

build: bin/csvcols bin/csvrows bin/csvfind bin/csvjoin bin/jsoncols bin/jsonrange bin/xlsx2json bin/xlsx2csv bin/csv2mdtable bin/csv2xlsx bin/csv2json

bin/csvcols: datatools.go cmds/csvcols/csvcols.go
	go build -o bin/csvcols cmds/csvcols/csvcols.go 

bin/csvrows: datatools.go cmds/csvrows/csvrows.go
	go build -o bin/csvrows cmds/csvrows/csvrows.go 

bin/csvjoin: datatools.go cmds/csvjoin/csvjoin.go
	go build -o bin/csvjoin cmds/csvjoin/csvjoin.go 

bin/jsoncols: datatools.go cmds/jsoncols/jsoncols.go
	go build -o bin/jsoncols cmds/jsoncols/jsoncols.go 

bin/jsonrange: datatools.go cmds/jsonrange/jsonrange.go
	go build -o bin/jsonrange cmds/jsonrange/jsonrange.go 

bin/xlsx2json: datatools.go cmds/xlsx2json/xlsx2json.go
	go build -o bin/xlsx2json cmds/xlsx2json/xlsx2json.go

bin/xlsx2csv: datatools.go cmds/xlsx2csv/xlsx2csv.go
	go build -o bin/xlsx2csv cmds/xlsx2csv/xlsx2csv.go

bin/csv2mdtable: datatools.go cmds/csv2mdtable/csv2mdtable.go
	go build -o bin/csv2mdtable cmds/csv2mdtable/csv2mdtable.go

bin/csv2xlsx: datatools.go cmds/csv2xlsx/csv2xlsx.go
	go build -o bin/csv2xlsx cmds/csv2xlsx/csv2xlsx.go

bin/csv2json: datatools.go cmds/csv2json/csv2json.go
	go build -o bin/csv2json cmds/csv2json/csv2json.go

bin/csvfind: datatools.go cmds/csvfind/csvfind.go
	go build -o bin/csvfind cmds/csvfind/csvfind.go


test:
	go test

website:
	./mk-website.bash

status:
	git status

save:
	if [ "$(msg)" != "" ]; then git commit -am "$(msg)"; else git commit -am "Quick Save"; fi
	git push origin $(BRANCH)

refresh:
	git fetch origin
	git pull origin $(BRANCH)

publish:
	./mk-website.bash
	./publish.bash

clean: 
	if [ -d bin ]; then /bin/rm -fR bin; fi
	if [ -d dist ]; then /bin/rm -fR dist; fi

install:
	env GOBIN=$(HOME)/bin go install cmds/csvcols/csvcols.go
	env GOBIN=$(HOME)/bin go install cmds/csvrows/csvrows.go
	env GOBIN=$(HOME)/bin go install cmds/csvfind/csvfind.go
	env GOBIN=$(HOME)/bin go install cmds/csvjoin/csvjoin.go
	env GOBIN=$(HOME)/bin go install cmds/jsoncols/jsoncols.go
	env GOBIN=$(HOME)/bin go install cmds/jsonrange/jsonrange.go
	env GOBIN=$(HOME)/bin go install cmds/xlsx2json/xlsx2json.go
	env GOBIN=$(HOME)/bin go install cmds/xlsx2csv/xlsx2csv.go
	env GOBIN=$(HOME)/bin go install cmds/csv2mdtable/csv2mdtable.go
	env GOBIN=$(HOME)/bin go install cmds/csv2xlsx/csv2xlsx.go
	env GOBIN=$(HOME)/bin go install cmds/csv2json/csv2json.go

dist/linux-amd64:
	mkdir -p dist/bin
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csvcols cmds/csvcols/csvcols.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csvrows cmds/csvrows/csvrows.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csvfind cmds/csvfind/csvfind.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csvjoin cmds/csvjoin/csvjoin.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/jsoncols cmds/jsoncols/jsoncols.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/jsonrange cmds/jsonrange/jsonrange.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/xlsx2json cmds/xlsx2json/xlsx2json.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/xlsx2csv cmds/xlsx2csv/xlsx2csv.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csv2mdtable cmds/csv2mdtable/csv2mdtable.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csv2xlsx cmds/csv2xlsx/csv2xlsx.go
	env  GOOS=linux GOARCH=amd64 go build -o dist/bin/csv2json cmds/csv2json/csv2json.go
	cd dist && zip -r $(PROJECT)-$(VERSION)-linux-amd64.zip README.md LICENSE INSTALL.md bin/* docs/* how-to/* demos/*
	rm -fR dist/bin

dist/macosx-amd64:
	mkdir -p dist/bin
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csvcols cmds/csvcols/csvcols.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csvrows cmds/csvrows/csvrows.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csvfind cmds/csvfind/csvfind.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csvjoin cmds/csvjoin/csvjoin.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/jsoncols cmds/jsoncols/jsoncols.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/jsonrange cmds/jsonrange/jsonrange.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/xlsx2json cmds/xlsx2json/xlsx2json.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/xlsx2csv cmds/xlsx2csv/xlsx2csv.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csv2mdtable cmds/csv2mdtable/csv2mdtable.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csv2xlsx cmds/csv2xlsx/csv2xlsx.go
	env  GOOS=darwin GOARCH=amd64 go build -o dist/bin/csv2json cmds/csv2json/csv2json.go
	cd dist && zip -r $(PROJECT)-$(VERSION)-macosx-amd64.zip README.md LICENSE INSTALL.md bin/* docs/* how-to/* demos/*
	rm -fR dist/bin

dist/windows-amd64:
	mkdir -p dist/bin
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csvcols.exe cmds/csvcols/csvcols.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csvrows.exe cmds/csvrows/csvrows.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csvfind.exe cmds/csvfind/csvfind.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csvjoin.exe cmds/csvjoin/csvjoin.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/jsoncols.exe cmds/jsoncols/jsoncols.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/jsonrange.exe cmds/jsonrange/jsonrange.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/xlsx2json.exe cmds/xlsx2json/xlsx2json.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/xlsx2csv.exe cmds/xlsx2csv/xlsx2csv.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csv2mdtable.exe cmds/csv2mdtable/csv2mdtable.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csv2xlsx.exe cmds/csv2xlsx/csv2xlsx.go
	env  GOOS=windows GOARCH=amd64 go build -o dist/bin/csv2json.exe cmds/csv2json/csv2json.go
	cd dist && zip -r $(PROJECT)-$(VERSION)-windows-amd64.zip README.md LICENSE INSTALL.md bin/* docs/* how-to/* demos/*
	rm -fR dist/bin


dist/raspbian-arm7:
	mkdir -p dist/bin
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csvcols cmds/csvcols/csvcols.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csvrows cmds/csvrows/csvrows.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csvfind cmds/csvfind/csvfind.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csvjoin cmds/csvjoin/csvjoin.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/jsoncols cmds/jsoncols/jsoncols.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/jsonrange cmds/jsonrange/jsonrange.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/xlsx2json cmds/xlsx2json/xlsx2json.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/xlsx2csv cmds/xlsx2csv/xlsx2csv.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csv2mdtable cmds/csv2mdtable/csv2mdtable.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csv2xlsx cmds/csv2xlsx/csv2xlsx.go
	env  GOOS=linux GOARCH=arm GOARM=7 go build -o dist/bin/csv2json cmds/csv2json/csv2json.go
	cd dist && zip -r $(PROJECT)-$(VERSION)-raspbian-arm7.zip README.md LICENSE INSTALL.md bin/* docs/* how-to/* demos/*
	rm -fR dist/bin

distribute_docs:
	mkdir -p dist/docs
	mkdir -p dist/how-to
	cp -v README.md dist/
	cp -v LICENSE dist/
	cp -v INSTALL.md dist/
	cp -v docs/csv2json.md dist/docs/
	cp -v docs/csv2mdtable.md dist/docs/
	cp -v docs/csv2xlsx.md dist/docs/
	cp -v docs/csvcols.md dist/docs/
	cp -v docs/csvrows.md dist/docs/
	cp -v docs/csvfind.md dist/docs/
	cp -v docs/csvjoin.md dist/docs/
	cp -v docs/index.md dist/docs/
	cp -v docs/jsoncols.md dist/docs/
	cp -v docs/jsonrange.md dist/docs/
	cp -v docs/xlsx2csv.md dist/docs/
	cp -v docs/xlsx2json.md dist/docs/
	cp -v how-to/*.md dist/how-to/
	cp -vR demos dist/
	
release: distribute_docs dist/linux-amd64 dist/macosx-amd64 dist/windows-amd64 dist/raspbian-arm7

