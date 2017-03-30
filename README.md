# Booster Catalog
Set of known example applications (Boosters) conforming to the minimal set of requirements necessary to be served by the Launchpad.

For each example application, create a YAML file with information containing:

Name   | Description 
------ | -----------
githubRepo| The GitHub repository location
gitRef | The git reference (tag/branch/SHA1)
boosterDescriptorPath|  (Optional) Path in the repository specified to `booster.yaml` (defaults to `.openshiftio/booster.yaml`)

The `booster.yaml` file is expected to have the following structure:

Name   | Description | Required | Size
------ | ----------- | -----    | ----
name | The quickstart name  |  Yes  |  50
descriptionPath  |  (Optional) Link to file in repo containing adoc for the description (assumed default: `.openshiftio/description.adoc` ) |No  |  255
