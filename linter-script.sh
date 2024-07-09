#!/bin/bash
echo "Starting script..."
echo "Go to backend..."
cd backend/
echo "-------------------"
echo "Activating code style..."
black .
echo "Code style activated..."
echo "-------------------"
echo "Activating imports style..."
isort .
echo "Imports style activated..."
echo "-------------------"
echo "Verifiying code..."
flake8 .
echo "Code verified..."
echo "-------------------"
echo "Verifiying types..."
mypy . --explicit-package-bases
echo "Types verified..."
echo "-------------------"
echo "Verifiying security..."
bandit -r .
echo "Security verified..."
echo "-------------------"
echo "Go to frontend..."
cd ../frontend/
echo "-------------------"
echo "Verifiying code style..."
flutter analyze
echo "Code style verified..."
echo "-------------------"
echo "Verifiying quality code..."
flutter pub run dart_code_metrics:metrics lib
echo "Quality code verified..."
echo "-------------------"
echo "Script completed!"
