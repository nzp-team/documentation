% info_changesky - NZ:P Mapping Documentation
# info_changesky

## Introduction

`info_changesky` is a point entity used to update the Sky Box across all clients. Upon activation, the current skybox textures will be freed and the specified ones will be streamed and loaded. Due to this overhead, there may be a performance cost for the act of changing the sky and as such it should be used conservatively.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Sky Name | `name` | `""` | Sky box name (e.g. `"ndu"`)