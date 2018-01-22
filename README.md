# Booster Catalog
Set of known example applications (Boosters) conforming to the minimal set of requirements necessary to be served by developers.redhat.com/launch.

Branching and tagging strategy:
- `master`:
    - should always point to the latest development branches of the boosters
        - if a particular variant of a booster isn't available in a branch, then it should point to the latest tag
    - can be updated at any time, because it's not used in any Fabric8 Launcher instance we run
- `next`:
    - should always point to the latest tags of the boosters
    - can be updated at any time, because it's only used in the staging Fabric8 Launcher instance we run
    - booster catalog releases are cut from this branch
        - the release is only cut when all the boosters dependencies are available publicly
        - the catalog release is used in the production Fabric8 Launcher instance we run, but only when you target an OpenShift Online Pro cluster
        - the catalog release is also used when you install Fabric8 Launcher locally from the template
- `openshift-online-free`:
    - should only contain the boosters that can successfully run in OpenShift Online Starter
    - should always point to the latest tags of the boosters
    - is used in the production Fabric8 Launcher instance we run, if you target an OpenShift Online Starter cluster
    - can only be updated when all the boosters dependencies are available publicly
        - this is because updates to this branch can percolate to the production Fabric8 Launcher instance at any time

The repository has a `metadata.json` file in the root containing a list of the supported missions and runtimes along with their human-readable names.

IMPORTANT: If a new mission or runtime is introduced, you MUST change the `metadata.json` file too. 

This repository is organized by `{mission}/{runtime}/booster.yaml` or  `{mission}/{runtime}/{version}/{name}.yaml` depending if your booster supports runtime versions or not:

For each Booster (example application), create a YAML file in the respective `{mission}/{runtime}` (or  `{mission}/{runtime}/{version}`) directory named `booster.yaml` (but it can have any name you want, except `common.yaml`). In it should be the following information:

Name   | Description 
------ | -----------
name | The name of the Booster
description | (Optional) A longer description for the Booster
gitRepo | The Git repository location URL
gitRef | The Git reference (tag/branch/SHA1)
ignore | (Optional) Set this to "true" to have the Booster be ignored by the Launcher
metadata/version | If the Booster supports versions then this is the name that will be shown in the UI
metadata/runsOn | (Optional) A single cluster type or a list of cluster types where this booster can run. If the key is not specified or has the single value `*` the booster will run everywhere. If the key is specified but has no values then it will run nowhere.
metadata/doesNotRunOn | (Optional) A single cluster type or a list of cluster types where this booster can _not_ run. If the key is not specified the booster will run everywhere. If the key is specified but has no values or it has the single value `*` then it will run nowhere.
metadata/buildProfile | (Optional) The Maven profile that should be activated in the booster's `pom.xml` file

Often separate Boosters will share the same infotmation. For example both the community and official supported versions of a Booster will most likely have the same name and description. To avoid duplication you can put those items in a `common.yaml` file instead. When the Launcher encounters a `common.yaml` file in the catalog _all_ Boosters in the same folder and in all sub folders will be based on the information found in that file. The file can contain the exact same information as a `booster.yaml` file. Any information in the `booster.yaml` files will merge with or overwrite the information found in the `common.yaml` file. Application of `common.yaml` files is recursive, so `common.yaml` files in sub folders will overwrite values found in `common.yaml` files in parent folders.

For an in-depth explanation of how to declare runtime versions see [HOWTO Add Runtime Versions to Boosters](https://github.com/fabric8-launcher/launcher-booster-catalog/wiki/HOWTO-Add-Runtime-Versions-to-Boosters)

