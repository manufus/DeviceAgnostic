import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/cards_data.dart';  // Import for cuisine data
import '../controllers/recipe_controller.dart';  // Import the RecipeController

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Inject the RecipeController using GetX
  final RecipeController recipeController = Get.find<RecipeController>();

  // Form field controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  // Dynamic lists for ingredients and steps
  final List<Map<String, String>> _ingredients = [];
  final List<Map<String, String>> _steps = [];

  // TextEditingControllers for adding new ingredient and step
  final TextEditingController _ingredientNameController = TextEditingController();
  final TextEditingController _ingredientAmountController = TextEditingController();
  final TextEditingController _stepTitleController = TextEditingController();
  final TextEditingController _stepDescriptionController = TextEditingController();
  final TextEditingController _stepImageController = TextEditingController();

  // Selected cuisine variable
  String? _selectedCuisine;

  // Submit form and add recipe
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Create a new recipe map
      Map<String, dynamic> newRecipe = {
        "id": recipeController.recipeList.length + 1,  // Auto-increment the ID
        "name": _titleController.text,
        "description": _descriptionController.text,
        "image": _imageController.text,
        "cuisine": _selectedCuisine ?? "Unknown", // Use selected cuisine
        "isFavorite": false, // Default favorite value
        "isUserCreated": true, // Mark as user-created
        "ingredients": _ingredients,
        "steps": _steps,
      };

      // Use the controller to add the new recipe
      recipeController.addRecipe(newRecipe);  // Add to Hive via the RecipeController

      // Navigate back to the previous screen after adding the recipe
      Navigator.pop(context);
    }
  }

  // Add new ingredient
  void _addIngredient() {
    if (_ingredientNameController.text.isNotEmpty && _ingredientAmountController.text.isNotEmpty) {
      setState(() {
        _ingredients.add({
          "name": _ingredientNameController.text,
          "amount": _ingredientAmountController.text,
        });
        _ingredientNameController.clear();
        _ingredientAmountController.clear();
      });
    }
  }

  // Add new step
  void _addStep() {
    if (_stepTitleController.text.isNotEmpty && _stepDescriptionController.text.isNotEmpty && _stepImageController.text.isNotEmpty) {
      setState(() {
        _steps.add({
          "title": _stepTitleController.text,
          "description": _stepDescriptionController.text,
          "image": _stepImageController.text,
        });
        _stepTitleController.clear();
        _stepDescriptionController.clear();
        _stepImageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title Input
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              // Description Input
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              // Image Input
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Cuisine Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Cuisine"),
                value: _selectedCuisine,
                items: cuisinesData.map((cuisine) {
                  return DropdownMenuItem<String>(
                    value: cuisine['name'],
                    child: Text(cuisine['name']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCuisine = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a cuisine';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Ingredients Section
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _ingredients.map((ingredient) {
                  return ListTile(
                    title: Text("${ingredient['amount']} ${ingredient['name']}"),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _ingredientNameController,
                decoration: InputDecoration(labelText: 'Ingredient Name'),
              ),
              TextFormField(
                controller: _ingredientAmountController,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              ElevatedButton(
                onPressed: _addIngredient,
                child: Text('Add Ingredient'),
              ),

              SizedBox(height: 20),

              // Steps Section
              Text(
                "Steps",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _steps.map((step) {
                  return ListTile(
                    title: Text(step['title']!),
                    subtitle: Text(step['description']!),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _stepTitleController,
                decoration: InputDecoration(labelText: 'Step Title'),
              ),
              TextFormField(
                controller: _stepDescriptionController,
                decoration: InputDecoration(labelText: 'Step Description'),
              ),
              TextFormField(
                controller: _stepImageController,
                decoration: InputDecoration(labelText: 'Step Image URL'),
              ),
              ElevatedButton(
                onPressed: _addStep,
                child: Text('Add Step'),
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
