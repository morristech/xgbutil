all: callback.go types_auto.go gofmt

gofmt:
	gofmt -w *.go */*.go examples/*.go examples/*/*.go
	colcheck *.go */*.go

callback.go:
	scripts/write-events callbacks > xevent/callback.go

types_auto.go:
	scripts/write-events evtypes > xevent/types_auto.go

tags:
	find ./ \( -name '*.go' -and -not -wholename './tests/*' \) -print0 | xargs -0 gotags > TAGS

loc:
	find ./ -name '*.go' -and -not -wholename './tests*' -and -not -name '*keysymdef.go' -print | sort | xargs wc -l

