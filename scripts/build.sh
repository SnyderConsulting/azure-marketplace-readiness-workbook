#!/usr/bin/env bash
set -euo pipefail

az bicep build --file main.bicep --outfile azuredeploy.json
