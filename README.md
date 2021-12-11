# google-icons-for-plantuml

Google icon sprite for PlantUML.

Inspired from [tupadr3/plantuml-icon-font-sprites](https://github.com/tupadr3/plantuml-icon-font-sprites).

Icons of this repository are able to use with [plantuml-stdlib/C4-PlantUML](https://github.com/plantuml-stdlib/C4-PlantUML).

## Getting Start

### import google cloud sprite

```plantuml
!define GICONURL https://raw.githubusercontent.com/ryutah/google-icons-for-plantuml/master/google-cloud
' include sprite that you want
!include GICONURL/cloud_run.puml
```

### import google workspace sprite

```plantuml
!define GWSICONURL https://raw.githubusercontent.com/ryutah/google-icons-for-plantuml/master/google-workspace
' include sprite that you want
!include GWSICONURL/gmail.puml
```

If you want to use sprite macro like [tupadr3/plantuml-icon-font-sprites](https://github.com/tupadr3/plantuml-icon-font-sprites), you should import common.puml of tupadr3/plantuml-icon-font-sprites.

```plantuml
!define ICONURL https://raw.githubusercontent.com/tupadr3/plantuml-icon-font-sprites/v2.4.0
!includeurl ICONURL/common.puml

' Then, include sprites
!define GICONURL https://raw.githubusercontent.com/ryutah/google-icons-for-plantuml/master/google-cloud
!include GICONURL/cloud_run.puml
```

## Example

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Context.puml

!define ICONURL https://raw.githubusercontent.com/tupadr3/plantuml-icon-font-sprites/v2.4.0
!includeurl ICONURL/common.puml

!define GICONURL https://raw.githubusercontent.com/ryutah/google-icons-for-plantuml/master/google-cloud
!include GICONURL/cloud_run.puml
!include GICONURL/app_engine.puml
!include GICONURL/datastore.puml
!include GICONURL/cloud_storage.puml

!define GWSICONURL https://raw.githubusercontent.com/ryutah/google-icons-for-plantuml/master/google-workspace
!include GWSICONURL/calendar.puml
!include GWSICONURL/gmail.puml

System(cloud_run, "Cloud Run", "webapp", $sprite="cloud_run")
System(app_engine, "App Engine", "webapp", $sprite="app_engine")
SystemDb(datastore, "Datastore", "database", $sprite="datastore")
SystemDb(cloud_storage, "Cloud Storage", "storage", $sprite="cloud_storage")

System(calendar, "Calendar", "calendar", $sprite="calendar")
System(gmail, "Gmail", "gmail", $sprite="gmail")

DEV_CLOUD_RUN(cloud_run2)
@enduml
```

![image](https://user-images.githubusercontent.com/6662577/145675866-9bc3dec2-bf38-4e49-a26e-eb7841f4dbf3.png)

## How to builds

### Required tools

1. [Inkscape](https://inkscape.org/)
1. [ImageMagick](https://imagemagick.org/index.php)
1. [PluntUML jar file](https://plantuml.com/ja/download)
1. python 3.x

### Steps

1. Install dependencies

   ```console
   pip install -r requirements.txt
   ```

1. Build sprites

   ```console
   make build
   ```

### Builds Google Workspace icon

#### Prerequired

1. Downlaods icons from [here](https://support.google.com/a/answer/9212588?hl=ja)
1. set environment variable `GOOGLE_WORKSPACE_ICON_ZIP_FILE_PATH` to location of download file path
1. run `make build`
