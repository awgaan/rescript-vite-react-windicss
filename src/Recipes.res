open RecipeTypes

let exampleRecipes: array<recipe> = [
  SolidFoodRecipe({
    name: "Cauliflower Fried Rice",
    timeToMake: 20,
    servings: 4,
    image: "https://picsum.photos/64/64",
  }),
  SolidFoodRecipe({
    name: "Italian Wedding Soup",
    timeToMake: 60,
    servings: 1,
    image: "https://picsum.photos/64/64",
  }),
]

@react.component
let make = () => {
  <div className="p-8 w-1/2 bg-white mx-auto rounded-xl shadow-lg">
    <ul className="divide-y divide-gray-100">
      {exampleRecipes
      ->Belt.Array.mapWithIndex((ind, recipe) => <Recipe key={Belt.Int.toString(ind)} recipe />)
      ->React.array}
    </ul>
  </div>
}
