# Borcelle-Clothing E-commerce Application - Local Setup Guide

This guide will help you set up and run the Borcelle-Clothing e-commerce application on your local PC.

## Prerequisites

Before you begin, make sure you have the following installed on your computer:

1. **Node.js** (version 20.x or later) - [Download from nodejs.org](https://nodejs.org/)
2. **PostgreSQL** - [Download PostgreSQL](https://www.postgresql.org/download/)
3. **Git** - [Download Git](https://git-scm.com/downloads)

## Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
git clone <repository-url> borcelle-clothing
cd borcelle-clothing
```

## Step 2: Install Dependencies

Install all required packages using npm:

```bash
npm install
```

## Step 3: Set Up PostgreSQL Database

1. Create a new PostgreSQL database:

```bash
# Log in to PostgreSQL
psql -U postgres

# Create a new database
CREATE DATABASE borcelle_clothing;

# Exit PostgreSQL
\q
```

2. Create a `.env` file in the root directory with your database connection details:

```
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
```

Replace `your_password` with your PostgreSQL password, and generate a random string for `SESSION_SECRET`.

## Step 4: Set Up Database Schema

Run the Drizzle migration to create your database schema:

```bash
npm run db:push
```

## Step 5: Start the Application

Start the development server:

```bash
npm run dev
```

The application should now be running at [http://localhost:3000](http://localhost:3000).

## Optional: Seed the Database

The application automatically attempts to seed the database with sample data when it starts. If you want to manually trigger the seeding process, you can add this code to your server's startup logic or run it manually.

## Authentication

The application comes with pre-configured authentication:

- You can register for a new account using the registration form
- Or use the following sample credentials:
  - Username: `demo`
  - Password: `Password123`

## Features

1. **User Authentication**: Register, login, logout
2. **Product Browsing**: View products by category, search, filter
3. **Shopping Cart**: Add products, manage quantities, remove items
4. **Wishlist**: Save products for later
5. **Checkout Process**: Complete the purchase process
6. **User Profile**: Manage account details, view orders

## Stripe Integration (Optional)

If you want to use the Stripe payment gateway:

1. Create a Stripe account at [stripe.com](https://stripe.com)
2. Get your API keys from the Stripe dashboard
3. Add your Stripe keys to the `.env` file
4. Test the payment flow with Stripe test card: `4242 4242 4242 4242` (any future expiry date, any CVC, any ZIP)

## Troubleshooting

- **Database Connection Issues**: Double-check your PostgreSQL connection settings in the `.env` file
- **PostgreSQL Authentication**: Ensure your PostgreSQL user has the correct permissions
- **Node.js Version**: Make sure you're using Node.js 20.x or later
- **Port Conflicts**: If port 3000 is already in use, change it in the server configuration

## Support

If you encounter any issues, please refer to the documentation or contact support.

Happy shopping with Borcelle-Clothing!