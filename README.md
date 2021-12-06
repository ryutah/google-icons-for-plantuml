# plantuml-icons-for-plantuml

Google Cloud icon sprite for PlantUML
Currently, only icons for c4 model are available.

## Example

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Context.puml

!define GICONURL https://raw.githubusercontent.com/ryutah/plantuml-icons-for-plantuml/master/dist
!include GICONURL/cloud_run.puml
!include GICONURL/app_engine.puml
!include GICONURL/datastore.puml
!include GICONURL/cloud_storage.puml

System(cloud_run, "Cloud Run", "webapp", $sprite="cloud_run")
System(app_engine, "App Engine", "webapp", $sprite="app_engine")
System(app_engine, "App Engine", "webapp", $sprite="app_engine")
SystemDb(datastore, "Datastore", "database", $sprite="datastore")
SystemDb(cloud_storage, "Cloud Storage", "storage", $sprite="cloud_storage")
@enduml
```

![image](https://user-images.githubusercontent.com/6662577/144869484-a4f741be-83ef-4b2b-8cf6-5f9aa52c2604.png)

## How to builds

### Required tools

1. [Inkscape](https://inkscape.org/)
1. [ImageMagick](https://imagemagick.org/index.php)
1. [PluntUML jar file](https://plantuml.com/ja/download)

### Steps

1. Downloads icons

   ```console
   ./scripts/download_gcp_icons.sh
   ```

1. Generate sprite

   ```console
   ./scripts/create_sprite.sh
   ```
