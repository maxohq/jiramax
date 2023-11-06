#!/usr/bin/env bash

rm -rf lib/jiramax/
mix api.gen default schemas/swagger-v3.v3.yaml
