# Booster Catalog
Set of known example applications (Boosters) conforming to the minimal set of requirements necessary to be served by launch.openshift.io.

- next: this is the branch from which we'll cut the next tag. Production does not use this branch, it is only used in the staging environment.
- openshift-online-free; this branch is used in staging AND production. Only the Boosters capable of running in the OSO Free environment are included here.

The repository has a `metadata.json` file in the root containing a list of the supported missions and runtimes along with their human-readable names.

IMPORTANT: If a new mission or runtime is introduced, you MUST change the `metadata.json` file too. 

This repository is organized by `{mission}/{runtime}/{booster-catalog-entry}.yaml` or  `{mission}/{runtime}/{version}/{booster-catalog-entry}.yaml` depending if your booster supports runtime versions or not:

For each booster (example application), create a YAML file in the respective `{mission}/{runtime}` (or  `{mission}/{runtime}/{version}`) directory with information containing:

Name   | Description 
------ | -----------
githubRepo| The GitHub repository location
gitRef | The git reference (tag/branch/SHA1)
boosterDescriptorPath| (Optional) Path in the repository specified to `booster.yaml` (defaults to `.openshiftio/booster.yaml`)
buildProfile| (Optional) The Maven profile that should be activated in the booster's `pom.xml` file

The `booster.yaml` file beforementioned is expected to have the following structure:

Name   | Description | Required | Size
------ | ----------- | -----    | ----
name | The booster name  |  Yes  |  50
descriptionPath  |  (Optional) Link to file in repo containing adoc for the description (assumed default: `.openshiftio/description.adoc` ) |No  |  255
jenkinsfilePath | (Optional) Link to file in repo, relative to the repo root, for the Jenkins Pipeline Definition file (assumed default: `Jenkinsfile`) | No | 255
versions | A list of associative arrays containing `id` and `name` elements that map version ids to their human-readable names |  No  |  --

For an in-depth explanation of how to declare runtime versions see [HOWTO Add Runtime Versions to Boosters](https://github.com/openshiftio/booster-catalog/wiki/HOWTO-Add-Runtime-Versions-to-Boosters)
