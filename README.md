# Booster Catalog
Set of known example applications (Boosters) conforming to the minimal set of requirements necessary to be served by the Launchpad.

This repository contains the following directories:

- `missions`: The missions supported by this catalog
- `runtimes`: The runtimes supported by this catalog
- `boosters`: The boosters supported by this catalog


For each mission, create a YAML file in the `missions` directory with information containing:

Name   | Description 
------ | -----------
name   | The mission name
docURI | The documentation URI for this mission

For each runtime, create a YAML file in the `runtimes` directory with information containing:

Name   | Description 
------ | -----------
name   | The runtime name
docURI | The documentation URI for this runtime

For each booster (example application), create a YAML file in the `boosters` directory with information containing:

Name   | Description 
------ | -----------
githubRepo| The GitHub repository location
gitRef | The git reference (tag/branch/SHA1)
mission | The Mission that this booster refers to (Use the file name from the `missions` directory without the `.yml` extension)
runtime | The Runtime that this booster refers to (Use the file name from the `runtimes` directory without the `.yml` extension)
boosterDescriptorPath|  (Optional) Path in the repository specified to `booster.yaml` (defaults to `.openshiftio/booster.yaml`)

The `booster.yaml` file beforementioned is expected to have the following structure:

Name   | Description | Required | Size
------ | ----------- | -----    | ----
name | The booster name  |  Yes  |  50
descriptionPath  |  (Optional) Link to file in repo containing adoc for the description (assumed default: `.openshiftio/description.adoc` ) |No  |  255
jenkinsfilePath | (Optional) Link to file in repo, relative to the repo root, for the Jenkins Pipeline Definition file (assumed default: `.openshiftio/Jenkinsfile`) | No | 255
