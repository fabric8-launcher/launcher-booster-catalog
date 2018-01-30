# Booster Catalog
Set of known example applications (Boosters) conforming to the minimal set of requirements necessary to be served by developers.redhat.com/launch.

### Metadata

The repository has a `metadata.json` file in the root containing a list of the supported missions and runtimes along with their human-readable names.

IMPORTANT: If a new mission or runtime is introduced, you MUST change the `metadata.json` file too. 

### Catalog structure

This repository is organized by `{mission}/{runtime}/booster.yaml` or  `{mission}/{runtime}/{version}/{name}.yaml` depending if your booster supports runtime versions or not:

### Booster descriptor

For each Booster, create a YAML file in the respective `{mission}/{runtime}` (or  `{mission}/{runtime}/{version}`) directory named `booster.yaml` (although it can have any name you want, except `common.yaml`). In it should be the following information:

Name   | Description 
------ | -----------
name | The name of the Booster
description | (Optional) A longer description for the Booster
ignore | (Optional) Set this to "true" to have the Booster be ignored by the Launcher
source/git/url | The Git repository location URL
source/git/ref | The Git reference (tag/branch/SHA1)
metadata/version/name | If the Booster supports versions then this is the name that will be shown in the UI
metadata/runsOn | (Optional) A single cluster type or a list of cluster types where this booster can run. A type can be prefixed with `!` to negate the option: the booster will _not_ run on clusters of that type. Special values `all` and `none` indicate the booster will run everywhere or nowhere respectively. Important: when using the `!` to negate you _must_ surround it and the cluster type name with double quotes.
metadata/buildProfile | (Optional) The Maven profile that should be activated in the booster's `pom.xml` file

### Common values

Often separate Boosters will share the same information. For example both the community and officially supported versions of a Booster will most likely have the same name and description. To avoid duplication you can put those items in a `common.yaml` file instead. When the Launcher encounters a `common.yaml` file in the catalog _all_ Boosters in the same folder and in all sub folders will be based on the information found in that file. The file can contain the exact same information as a `booster.yaml` file. Any information in the `booster.yaml` files will merge with or overwrite the information found in the `common.yaml` file. Application of `common.yaml` files is recursive, so `common.yaml` files in sub folders will overwrite values found in `common.yaml` files in parent folders.

### Additional information

For a more in-depth explanation on how to create a Booster Catalog see [HOWTO Create a Booster-Catalog](https://github.com/fabric8-launcher/launcher-booster-catalog/wiki/HOWTO-Create-a-Booster-Catalog-(Generic)) or how to declare runtime versions [HOWTO Add Runtime Versions to Boosters](https://github.com/fabric8-launcher/launcher-booster-catalog/wiki/HOWTO-Add-Runtime-Versions-to-Boosters)

