# plantuml-icons-for-plantuml

Google Cloud icon sprite for PlantUML

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

![image](https://user-images.githubusercontent.com/6662577/145069614-e2292b09-a7ca-474c-a35d-d00a8f5602a7.png)

## How to builds

### Required tools

1. [Inkscape](https://inkscape.org/)
1. [PluntUML jar file](https://plantuml.com/ja/download)
1. python 3.x

### Steps

1. Install dependencies

   ```console
   pip install -r requirements.txt
   ```

1. Downloads icons

   ```console
   ./scripts/download_gcp_icons.sh
   ```

1. Generate sprite

   ```console
   ./scripts/create_sprite.sh
   ```
