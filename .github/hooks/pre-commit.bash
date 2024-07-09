#!/bin/sh

# Run linting
dartanalyzer --fatal-infos --fatal-warnings .

# Run code metrics
metrics lib
