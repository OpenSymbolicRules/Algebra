#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "=== OSR Schema Validation (Algebra) ==="
echo ""

# Step 1: Validate schemas themselves
echo "Step 1/4: Validating schemas against JSON Schema meta-schema..."
check-jsonschema --check-metaschema Specification/schemas/*.schema.json
echo "  PASS"

# Step 2: Validate meta.json
echo "Step 2/4: Validating rules/meta.json..."
check-jsonschema --schemafile Specification/schemas/meta.schema.json rules/meta.json
echo "  PASS"

echo ""
echo "=== Basic validations passed (add rules to validate further) ==="
