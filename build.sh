#!/bin/bash

set -e

appdir=$(cd $(dirname $0); pwd)

cd $appdir && npm install uglifyjs

$appdir/node_modules/.bin/uglifyjs \
    angular-async-loader.js -c -m \
    -o angular-async-loader.min.js \
    --source-map angular-async-loader.min.js.map


cd $appdir/demo && npm install

mkdir -p assets/requirejs/
cp node_modules/requirejs/require.js assets/requirejs/

mkdir -p assets/angular/
cp node_modules/angular/angular.min.js assets/angular/

mkdir -p assets/angular-ui-router/release/
cp node_modules/angular-ui-router/release/angular-ui-router.min.js assets/angular-ui-router/release/

mkdir -p assets/angular-async-loader/
cp ../angular-async-loader.min.js assets/angular-async-loader/

mkdir -p assets/angular-ui-mask/dist/
cp node_modules/angular-ui-mask/dist/mask.min.js assets/angular-ui-mask/dist/

mkdir -p assets/ng-tags-input/build/
cp node_modules/ng-tags-input/build/ng-tags-input.min.js assets/ng-tags-input/build/
cp node_modules/ng-tags-input/build/ng-tags-input.min.css assets/ng-tags-input/build/


