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

## Example

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Context.puml

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
@enduml
```

![image](https://user-images.githubusercontent.com/6662577/145675028-3023c412-16cd-4437-9e3f-6ae55fb493fe.png)

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
