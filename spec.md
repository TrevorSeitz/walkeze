Specifications for the Rails Assessment
Specs:

x Using Ruby on Rails for the project
x Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  Owner has_many Dogs
x Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Dog belongs to an Owner
X Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Dog has many Walks through Dogs_walks
x The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  The walks include a notes field for each dog on the walk
x Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Dog - validates :name, :breed, :age, presence: true
 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 Include signup (how e.g. Devise)
 Include login (how e.g. Devise)
 Include logout (how e.g. Devise)
 Include third party signup/login (how e.g. Devise/OmniAuth)
x Include nested resource show or index (URL e.g. users/2/recipes)
  users/1/dogs/1,
 Include nested resource "new" form (URL e.g. recipes/1/ingredients)
 Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:

 The application is pretty DRY
 Limited logic in controllers
x Views use helper methods if appropriate
x Views use partials if appropriate
