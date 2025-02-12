{ lib
, pkgs
, libsForQt5
}:

let
  packages = self: let
    inherit (self) callPackage;
  in {
    #### Core Apps
    lomiri-terminal-app = callPackage ./applications/lomiri-terminal-app { };

    #### Data
    lomiri-schemas = callPackage ./data/lomiri-schemas { };
    suru-icon-theme = callPackage ./data/suru-icon-theme { };

    #### Development tools / libraries
    cmake-extras = callPackage ./development/cmake-extras { };
    deviceinfo = callPackage ./development/deviceinfo { };
    geonames = callPackage ./development/geonames { };
    gmenuharness = callPackage ./development/gmenuharness { };
    libusermetrics = callPackage ./development/libusermetrics { };
    lomiri-api = callPackage ./development/lomiri-api { };
    lomiri-app-launch = callPackage ./development/lomiri-app-launch { };
    trust-store = callPackage ./development/trust-store { };
    u1db-qt = callPackage ./development/u1db-qt { };

    #### QML / QML-related
    lomiri-action-api = callPackage ./qml/lomiri-action-api { };
    lomiri-notifications = callPackage ./qml/lomiri-notifications { };
    lomiri-settings-components = callPackage ./qml/lomiri-settings-components { };
    lomiri-ui-extras = callPackage ./qml/lomiri-ui-extras { };
    lomiri-ui-toolkit = callPackage ./qml/lomiri-ui-toolkit { };

    #### Services
    biometryd = callPackage ./services/biometryd { };
    content-hub = callPackage ./services/content-hub { };
    hfd-service = callPackage ./services/hfd-service { };
    history-service = callPackage ./services/history-service { };
    lomiri-download-manager = callPackage ./services/lomiri-download-manager { };
    lomiri-url-dispatcher = callPackage ./services/lomiri-url-dispatcher { };
    mediascanner2 = callPackage ./services/mediascanner2 { };
  };
in
  lib.makeScope libsForQt5.newScope packages
