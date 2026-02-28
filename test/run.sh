#!/bin/bash

FILE=".github/workflows/04-using-actions.yaml"

echo "🔎 Checking workflow file..."

############################################
# 1. File exists
############################################
if [ ! -f "$FILE" ]; then
  echo "❌ Workflow file not found at $FILE"
  exit 1
fi
echo "✅ Workflow file exists"

############################################
# 2. Workflow name
############################################
grep -q "name: 04 - Uso de Actions" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ Workflow name is incorrect"
  exit 1
fi
echo "✅ Workflow name correct"

############################################
# 3. Trigger push
############################################
grep -q "push:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ push trigger not found"
  exit 1
fi
echo "✅ push trigger found"

############################################
# 4. Job build
############################################
grep -q "build:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ Job 'build' not found"
  exit 1
fi
echo "✅ Job build found"

############################################
# 5. Checkout action
############################################
grep -q "uses: actions/checkout@v4" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ actions/checkout@v4 not used"
  exit 1
fi
echo "✅ Checkout action correctly used"

############################################
# 6. Setup Node
############################################
grep -q "uses: actions/setup-node@v4" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ actions/setup-node@v4 not used"
  exit 1
fi
echo "✅ Setup Node action used"

grep -q "node-version: '20.x'" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ Node version 20.x not configured"
  exit 1
fi
echo "✅ Node version 20.x configured"

############################################
# 7. npm ci
############################################
grep -q "npm ci" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ npm ci not found"
  exit 1
fi
echo "✅ npm ci step found"

############################################
# 8. npm run test
############################################
grep -q "npm run test" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ npm run test not found"
  exit 1
fi
echo "✅ npm run test step found"

############################################
# 9. working-directory validation
############################################
grep -q "working-directory:" "$FILE"
if [ $? -ne 0 ]; then
  echo "❌ working-directory not configured"
  exit 1
fi
echo "✅ working-directory configured"

echo "🎉 All checks passed!"
exit 0
