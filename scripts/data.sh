#!/bin/bash
# This script generates an INSERT line for creating entries in the Product database that selects a random category from the product_category list; selects a random number between 1-100 as the "price" and generates a random 200 char "description" for the product.

# amazon's top 50 categories (thanks ChatGPT)
product_categories=(
  "Arts, Crafts & Sewing"
  "Automotive"
  "Baby"
  "Beauty & Personal Care"
  "Books"
  "Cell Phones & Accessories"
  "Clothing, Shoes & Jewelry"
  "Computers & Accessories"
  "Electronics"
  "Grocery & Gourmet Food"
  "Health & Household"
  "Home & Kitchen"
  "Industrial & Scientific"
  "Jewelry"
  "Kindle Store"
  "Lawn & Garden"
  "Luggage & Travel Gear"
  "Movies & TV"
  "Musical Instruments"
  "Office Products"
  "Patio, Lawn & Garden"
  "Pet Supplies"
  "Sports & Outdoors"
  "Tools & Home Improvement"
  "Toys & Games"
  "Video Games"
  "Watches"
  "Apps & Games"
  "Beauty"
  "Handmade"
  "Home"
  "Home Improvement"
  "Kindle E-readers & Books"
  "Luxury Beauty"
  "MP3 Music"
  "Music"
  "Musical Instruments, Stage & Studio"
  "Office & School Supplies"
  "Personal Computers"
  "Prime Video"
  "Software"
  "Sports & Fitness"
  "Tools & Equipment"
  "Tours & Activities"
  "VHS"
  "Video"
  "Video Shorts"
)

# Function to generate a random description string of words no longer than 200 characters
get_random_description() {
  # Generate a random number of words between 1 and 50
  num_words=$((RANDOM % 50 + 1))

  # Initialize the description string
  description=""

  # Generate a random word for each iteration
  for ((i=0; i<num_words; i++)); do
    # Generate a random length for the word between 1 and 15 characters
    word_length=$((RANDOM % 15 + 1))

    # Append the random word to the description string
    description+=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w $word_length | head -n 1)

    # Add a space after the word, unless it is the last word
    if [ $i -lt $((num_words - 1)) ]; then
      description+=" "
    fi
  done

  # Truncate the description string to be no longer than 200 characters
  description=${description:0:200}

  echo "$description"
}

###
# POST
# format: {"name": "test-product","description":"random-description",price": 100.00}

# Set the URL for the POST request
url="http://localhost:8080/api/products"

# Set the number of iterations for the for loop
iterations=5

# Iterate over the loop and curl the POST request
for ((i=0; i<iterations; i++)); do
    data='{"name": "'"${product_categories[$((RANDOM % ${#product_categories[@]}))]}"'","price":'"$((RANDOM % 100 + 1))"',"description":"'"$(get_random_description)"'"}'
    echo "$data"
    #curl -X POST -H "Content-Type: application/json" -d "$data" "$url"
done
