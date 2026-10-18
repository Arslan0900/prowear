#!/bin/bash

echo "🚀 Starting GitHub Actions Setup..."

# 1. Workflows folder banayein
mkdir -p .github/workflows

# 2. dev.yml file banayein
cat << 'EOF' > .github/workflows/dev.yml
name: Deploy to Development
on:
  push:
    branches:
      - develop
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: development
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Dev
        run: echo "🚀 Deploying to Development environment..."
EOF

# 3. staging.yml file banayein
cat << 'EOF' > .github/workflows/staging.yml
name: Deploy to Staging
on:
  push:
    branches:
      - staging
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Staging
        run: echo "🧪 Deploying to Staging environment..."
EOF

# 4. prod.yml file banayein
cat << 'EOF' > .github/workflows/prod.yml
name: Deploy to Production
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to Prod
        run: echo "🔥 Deploying to Production environment..."
EOF

echo "✅ Workflow files created!"

# 5. Main branch par commit aur push karein
echo "📦 Committing and pushing to main..."
git checkout main || git checkout master
git add .github/workflows/
git commit -m "Add CI/CD workflows for dev, staging, and prod"
git push origin HEAD

# 6. Develop branch banayein aur push karein
echo "🌿 Creating develop branch..."
git checkout -b develop
git push -u origin develop

# 7. Staging branch banayein aur push karein
echo "🌿 Creating staging branch..."
git checkout -b staging
git push -u origin staging

# 8. Wapas main branch par aayein
git checkout main || git checkout master

echo "🎉 Setup Complete! Saari files ban gayi hain aur branches GitHub par push ho gayi hain."
