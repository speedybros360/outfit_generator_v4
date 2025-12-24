// Declare global variables for images and folders
String[] imageFolders = {
  "background", 
  "avatar", 
  "shirt", 
  "jacket", 
  "pants", 
  "shoes"
};

PImage backgroundImg, avatarImg, shirtImg, jacketImg, pantsImg, shoesImg;
ArrayList<String> backgrounds = new ArrayList<String>();
ArrayList<String> avatars = new ArrayList<String>();
ArrayList<String> shirts = new ArrayList<String>();
ArrayList<String> jackets = new ArrayList<String>();
ArrayList<String> pants = new ArrayList<String>();
ArrayList<String> shoes = new ArrayList<String>();

void setup() {
  size(500, 900); // Set the canvas size
  
  // Load image paths into respective lists
  loadImages("background", backgrounds);
  loadImages("avatar", avatars);
  loadImages("shirt", shirts);
  loadImages("jacket", jackets);
  loadImages("pants", pants);
  loadImages("shoes", shoes);
  
  // Load and display the first set of random images
  updateImages();
}

void draw() {
  // Nothing needs to be drawn in draw(), as the images will be updated when mouse is clicked
}

// Load image paths into the ArrayList
void loadImages(String folderName, ArrayList<String> list) {
  String folderPath = sketchPath("images/" + folderName);  // Construct path to the folder
  File folder = new File(folderPath);
  String[] files = folder.list();
  
  if (files != null) {
    for (String file : files) {
      if (file.endsWith(".png") || file.endsWith(".jpg") || file.endsWith(".jpeg")) {
        list.add(folderPath + "/" + file);
      }
    }
  }
}

// Update images when the mouse is pressed
void mousePressed() {
  updateImages();
}

void keyPressed(){
  updateImages();
}

// Function to update images randomly
void updateImages() {
  backgroundImg = loadRandomImage(backgrounds);
  avatarImg = loadRandomImage(avatars);
  shirtImg = loadRandomImage(shirts);
  jacketImg = loadRandomImage(jackets);
  pantsImg = loadRandomImage(pants);
  shoesImg = loadRandomImage(shoes);
  
  // Check if any image failed to load
  if (backgroundImg == null || avatarImg == null || shirtImg == null || jacketImg == null || pantsImg == null || shoesImg == null) {
    println("Error: One or more images failed to load. Try clicking again.");
    return;
  }
  
  // Resize images if necessary
  backgroundImg.resize(width, height);
  
  // Display the background image
  image(backgroundImg, 0, 0);
  
  // Display the overlay images on top of the background (resize them if necessary)
  avatarImg.resize(175, 175);
  shirtImg.resize(300, 200);
  jacketImg.resize(150, 100);
  pantsImg.resize(300, 400);
  shoesImg.resize(100, 100);

  // Draw the images at specific positions on the canvas
  image(jacketImg, 325, 350);
  image(pantsImg, 90, 375);
  image(avatarImg, 150, 30);
  image(shirtImg, 80, 200);
  image(shoesImg, 100, 725);
  image(shoesImg, 320, 725);
}

// Function to load a random image from a list
PImage loadRandomImage(ArrayList<String> list) {
  if (list.size() > 0) {
    String filePath = list.get(int(random(list.size()))); // Pick a random image file path
    return loadImage(filePath);  // Load the image from the file path
  } else {
    return null;  // Return null if the list is empty
  }
}
