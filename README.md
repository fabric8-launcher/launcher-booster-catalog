# Booster Catalog
Set of known example applications (Boosters) conforming to the minimal set of requirements necessary to be served by developers.redhat.com/launch.

### Metadata

The repository has a `metadata.yaml` file in the root containing a list of the supported missions and runtimes along with their human-readable names and other information. The basic format is like this:

```yaml
missions:
- id: crud
  name: CRUD
- id: circuit-breaker
  name: Circuit Breaker
runtimes:
- id: vert.x
  name: Eclipse Vert.x
  icon: data:image/svg+xml;...
  metadata:
    pipelinePlatform: maven
  versions:
  - id: redhat
    name: 3.4.2.redhat-006 (RHOAR)
  - id: community
    name: 3.5.0.Final (Community)
```

Where you have a list of `missions` and a list of `runtimes` and each runtime has a list of `versions`. Each of those can have the following standard attributes:

Name   | Description 
------ | -----------
id | The id of the mission, runtime or version. Must coincide with the folder name
name | The name of the mission, runtime or version as shown in the UI
description | (Optional) A longer description for the mission, runtime or version
icon | (Optional) The icon to be shown in the UI (only for runtimes)
metadata | (Optional) A free section where booster authors can put their own information which will be passed on to REST endpoints and the UI

Known entries for the `metadata` section are:

Path   | Description 
------ | -----------
pipelinePlatform | (Optional) The Jenkins pipeline template to use for the boosters (only for runtimes)
suggested | (Optional) Will be marked in the UI as a suggested option
prerequisite | (Optional) The UI will mark this booster as needing special attention from the user

IMPORTANT: If a new mission or runtime is introduced, you MUST change the `metadata.yaml` file too. 

### Catalog structure

This repository is organized by `{runtime}/{version}/{mission}/booster.yaml`. Regardless if your booster supports runtime versions or not you'll have to specify at least a single `{version}` folder. If you don't know what to call it use `default`.

### Booster descriptor

For each Booster, create a YAML file in the respective `{mission}/{runtime}/{version}` directory named `booster.yaml` (it can have other names, but it should at least end with `booster.yaml`). In it should be the following information:

Name   | Description 
------ | -----------
name | The name of the Booster
description | (Optional) A longer description for the Booster
ignore | (Optional) Set this to "true" to have the Booster be ignored by the Launcher
source/git/url | The Git repository location URL
source/git/ref | The Git reference (tag/branch/SHA1)
environment | (Optional) The configuration for this booster in a specific environment to be overriden from the default configuration
metadata | (Optional) A free section where booster authors can put their own information which will be passed on to REST endpoints and the UI

> A note about environments:
> - https://launch.prod-preview.openshift.io consumes the configuration set in the `staging` environment tag
> - https://developers.redhat.com/launch consumes the configuration set in the `production`environment tag


Known entries for the `metadata` section are:

Path   | Description 
------ | -----------
runsOn | (Optional) A single cluster type or a list of cluster types where this booster can run. A type can be prefixed with `!` to negate the option: the booster will _not_ run on clusters of that type. Special values `all` and `none` indicate the booster will run everywhere or nowhere respectively. Important: when using the `!` to negate you _must_ surround it and the cluster type name with double quotes.
buildProfile | (Optional) The Maven profile that should be activated in the booster's `pom.xml` file
worksWithLegacyOsio | (Optional) If set to `true` the booster will be available for the legacy OSIO application

### Common values

Often separate Boosters will share the same information. For example both the community and officially supported versions of a Booster will most likely have the same name and description. To avoid duplication you can put those items in a `common.yaml` file instead. When the Launcher encounters a `common.yaml` file in the catalog _all_ Boosters in the same folder and in all sub folders will be based on the information found in that file. The file can contain the exact same information as a `booster.yaml` file. Any information in the `booster.yaml` files will merge with or overwrite the information found in the `common.yaml` file. Application of `common.yaml` files is recursive, so `common.yaml` files in sub folders will overwrite values found in `common.yaml` files in parent folders.

### Additional information

For a more in-depth explanation on how to create a Booster Catalog see [HOWTO Create a Booster-Catalog](https://github.com/fabric8-launcher/launcher-booster-catalog/wiki/HOWTO-Create-a-Booster-Catalog-(Generic)) or how to declare runtime versions [HOWTO Add Runtime Versions to Boosters](https://github.com/fabric8-launcher/launcher-booster-catalog/wiki/HOWTO-Add-Runtime-Versions-to-Boosters)

