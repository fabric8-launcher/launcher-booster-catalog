# Booster Catalog
Set of known Example Applications (Boosters) conforming to the minimal set of requirements necessary to be served by developers.redhat.com/launch.

### Metadata

The repository has a `metadata.json` file in the root containing a list of the supported missions and runtimes along with their human-readable names and other information. The basic format is like this:

```json
{
  "missions": [
    {
      "id": "crud",
      "name": "CRUD"
    },
    {
      "id": "circuit-breaker",
      "name": "Circuit Breaker"
    }
  ],
  "runtimes": [
    {
      "id": "vert.x",
      "name": "Eclipse Vert.x",
      "icon": "...",
      "metadata": {
        "pipelinePlatform": "maven"
      },
      "versions": [
        {
          "id": "redhat",
          "name": "3.4.2.redhat-009 (RHOAR)"
        },
        {
          "id": "community",
          "name": "3.5.0.Final (Community)"
        }
      ]
    },
  ]
}
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
level | (Optional) The approximate level of difficulty (foundational, advanced, expert)

IMPORTANT: If a new mission or runtime is introduced, you MUST change the `metadata.json` file too. 

### Catalog structure

The most important part of the catalog is the list of Example Applications that is contained in `catalog.json`. The format of the file is simply a JSON array of descriptor objects (see below).

### Example Application descriptor

For each Example Application, add a JON object to the catalog file. In that object should be the following information:

Name   | Description 
------ | -----------
name | The name of the Booster
description | (Optional) A longer description for the Booster
ignore | (Optional) Set this to "true" to have the Booster be ignored by the Launcher
repo | The Git repository location URL
ref | (Optional) The Git reference (defaults to "master")
metadata | (Optional) A free section where booster authors can put their own information which will be passed on to REST endpoints and the UI

Known entries for the `metadata` section are:

Path   | Description 
------ | -----------
mission | The id of the mission this Example Application belongs to (the ids are found in the `metadata.json`)
runtime | The id of the runtime the code in this Example Application uses (the ids are found in the `metadata.json`)
version | The id of the version of the runtime to use (the ids are found in the `metadata.json`)


