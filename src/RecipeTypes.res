type solidFoodRecipe = {
  name: string,
  timeToMake: int,
  servings: int,
  image: string,
}

type drinkColor = Red | Blue | Green | Clear

type recipe = SolidFoodRecipe(solidFoodRecipe)
