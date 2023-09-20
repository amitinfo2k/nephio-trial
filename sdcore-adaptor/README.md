# sdcore-adaptor

## Description
SD Core Adaptor

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] sdcore-adaptor`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree sdcore-adaptor`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init sdcore-adaptor
kpt live apply sdcore-adaptor --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
