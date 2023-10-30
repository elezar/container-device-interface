module github.com/container-orchestrated-devices/container-device-interface/cmd/validate

go 1.19

require github.com/container-orchestrated-devices/container-device-interface v0.0.0

require (
	github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f // indirect
	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
	github.com/xeipuuv/gojsonschema v1.2.0 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	sigs.k8s.io/yaml v1.3.0 // indirect
)

replace github.com/container-orchestrated-devices/container-device-interface => ../..

replace github.com/container-orchestrated-devices/container-device-interface/specs-go => ../../specs-go
