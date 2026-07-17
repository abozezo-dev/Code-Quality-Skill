#!/usr/bin/env bash
set -e

# Code Verify and Clean Pipeline
# This script orchestrates the code verification and cleanup workflow

echo "🔍 Starting Code Verify & Clean Pipeline..."
echo ""

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
REPO_ROOT="$(cd "$SKILL_DIR/../.." && pwd)"

echo -e "${BLUE}📁 Repository root: $REPO_ROOT${NC}"
echo -e "${BLUE}📁 Skill directory: $SKILL_DIR${NC}"
echo ""

# Function to print section headers
print_header() {
    echo ""
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Function to print success messages
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Function to print error messages
print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Function to print warning messages
print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# 1. Detect Runtime
print_header "Step 1: Detect Runtime"

if [ -f "$REPO_ROOT/package-lock.json" ]; then
    MANAGER="npm"
    print_success "Detected npm (package-lock.json found)"
elif [ -f "$REPO_ROOT/pnpm-lock.yaml" ]; then
    MANAGER="pnpm"
    print_success "Detected pnpm (pnpm-lock.yaml found)"
elif [ -f "$REPO_ROOT/yarn.lock" ]; then
    MANAGER="yarn"
    print_success "Detected yarn (yarn.lock found)"
else
    MANAGER="none"
    print_warning "No package manager detected"
fi

echo "Package Manager: $MANAGER"
echo ""

# 2. Check Node.js installation
print_header "Step 2: Verify Node.js Installation"

if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    print_success "Node.js is installed: $NODE_VERSION"
else
    if [ "$MANAGER" != "none" ]; then
        print_warning "Node.js is not installed but package manager was detected"
    else
        print_success "No Node.js required for this repository"
    fi
fi

echo ""

# 3. Verify shell scripts syntax
print_header "Step 3: Verify Shell Scripts Syntax"

SHELL_SCRIPT_COUNT=0
SHELL_SCRIPT_ERRORS=0

# Find all shell scripts in the skills directory
while IFS= read -r -d '' script; do
    SHELL_SCRIPT_COUNT=$((SHELL_SCRIPT_COUNT + 1))
    if bash -n "$script" 2>/dev/null; then
        print_success "Syntax OK: $script"
    else
        print_error "Syntax Error: $script"
        SHELL_SCRIPT_ERRORS=$((SHELL_SCRIPT_ERRORS + 1))
    fi
done < <(find "$SKILL_DIR" -type f -name "*.sh" -print0 2>/dev/null)

if [ $SHELL_SCRIPT_COUNT -eq 0 ]; then
    print_warning "No shell scripts found in $SKILL_DIR"
else
    echo ""
    echo "Shell Scripts Checked: $SHELL_SCRIPT_COUNT"
    if [ $SHELL_SCRIPT_ERRORS -eq 0 ]; then
        print_success "All shell scripts have valid syntax"
    else
        print_error "$SHELL_SCRIPT_ERRORS script(s) have syntax errors"
        exit 1
    fi
fi

echo ""

# 4. Verify directory structure
print_header "Step 4: Verify Directory Structure"

REQUIRED_DIRS=(
    "assets"
    "reference"
    "scripts"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$SKILL_DIR/$dir" ]; then
        print_success "Directory exists: $dir"
    else
        print_warning "Directory missing: $dir"
    fi
done

echo ""

# 5. Verify documentation
print_header "Step 5: Verify Documentation"

if [ -f "$SKILL_DIR/SKILL.md" ]; then
    print_success "SKILL.md found"
else
    print_error "SKILL.md not found"
    exit 1
fi

if [ -f "$SKILL_DIR/reference/reporting-workflow.md" ]; then
    print_success "reporting-workflow.md found"
else
    print_warning "reporting-workflow.md not found"
fi

echo ""

# Final Summary
print_header "Pipeline Summary"

if [ $SHELL_SCRIPT_ERRORS -eq 0 ]; then
    print_success "Pipeline completed successfully!"
    echo ""
    echo -e "${GREEN}All checks passed!${NC}"
    exit 0
else
    print_error "Pipeline failed with errors"
    echo ""
    echo -e "${RED}Please fix the errors above and try again.${NC}"
    exit 1
fi
