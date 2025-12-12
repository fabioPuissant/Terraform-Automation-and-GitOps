# Copy the base_app directory to the target location
Copy-Item -Recurse .\base_app\ ..\taco-wagon-app

# Navigate to the target directory
Set-Location ..\taco-wagon-app

# Create git repository
git init -b main

# Stage all files for commit
git add .

# Commit the staged files with a message
git commit -m "Initial commit of Taco Wagon app"

# Install pre-commit if not already installed
pip install pre-commit

# Copy the pre-commit configuration file and tflint files

# Initialize Terraform without backend configuration
terraform init -backend=false

# Run pre-commit on all files
pre-commit run -a 

# Install pre-commit hooks
pre-commit install

# Stage any changes made by pre-commit and you
git add .

# View the status of the git repository
git status

# Commit any updates and see pre-commit fire
git commit -m "Apply pre-commit fixes"