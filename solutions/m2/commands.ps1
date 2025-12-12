# Create a GitHub repository for the Taco Wagon app
gh repo create taco-wagon-app --public --source=. --remote=origin --push

# Create a new branch after making updates
git checkout -B ci-pipeline

# Stage all files for commit
git add .

# Commit the staged files with a message
git commit -m "Set up GitHub repository and initial CI pipeline branch"

# Publish the ci-pipeline branch to GitHub
git push -u origin ci-pipeline

# Add the .trivyignore file to the repository
git add .trivyignore

# Commit the addition of the .trivyignore file
git commit -m "Add .trivyignore file to exclude specific vulnerabilities"

# Add the CD workflow file to the repository and commit
git add .github/workflows/cd.yml
git commit -m "Add continuous deployment workflow"

# Push the change to the ci-pipeline branch
git push