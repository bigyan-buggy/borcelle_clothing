#!/bin/bash

# Script to export the Borcelle-Clothing application for local use
echo "Preparing to export Borcelle-Clothing application..."

# Create a temporary directory
mkdir -p borcelle-export

# Copy all necessary files
echo "Copying files..."
cp -r attached_assets borcelle-export/
cp -r client borcelle-export/
cp -r server borcelle-export/
cp -r shared borcelle-export/
cp package.json borcelle-export/
cp package-lock.json borcelle-export/
cp drizzle.config.ts borcelle-export/
cp postcss.config.js borcelle-export/
cp tailwind.config.ts borcelle-export/
cp theme.json borcelle-export/
cp tsconfig.json borcelle-export/
cp vite.config.ts borcelle-export/
cp LOCAL_SETUP_GUIDE.md borcelle-export/

# Create a sample .env file
echo "Creating sample .env file..."
cat > borcelle-export/.env.example << EOL
# Database configuration
DATABASE_URL=postgresql://postgres:your_password@localhost:5432/borcelle_clothing
PGHOST=localhost
PGUSER=postgres
PGPASSWORD=your_password
PGDATABASE=borcelle_clothing
PGPORT=5432

# Session secret (generate a secure random string)
SESSION_SECRET=your_secret_random_string

# Optional Stripe keys (only needed if using Stripe checkout)
STRIPE_SECRET_KEY=your_stripe_secret_key
VITE_STRIPE_PUBLIC_KEY=your_stripe_public_key
EOL

# Create a zip file
echo "Creating zip archive..."
cd borcelle-export
zip -r ../borcelle-clothing.zip .
cd ..

# Clean up
echo "Cleaning up..."
rm -rf borcelle-export

echo "Export complete! You can now download borcelle-clothing.zip"
echo "Follow the instructions in LOCAL_SETUP_GUIDE.md to set up and run the application locally."