# sdcore-operator

## Description
Operator for SD Core 

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] sdcore-operator`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree sdcore-operator`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init sdcore-operator
kpt live apply sdcore-operator --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
