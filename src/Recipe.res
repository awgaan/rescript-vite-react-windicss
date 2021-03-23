open RecipeTypes

module FoodRecipe = {
  @react.component
  let make = (~name, ~timeToMake, ~servings, ~image) => {
    <article className="p-4 flex space-x-4">
      <img src=image className="flex-none w-18 h-18 rounded-lg bg-gray-100" />
      <div className="min-w-0 relative flex-auto">
        <h2 className="text-lg font-semibold text-black mb-0.5"> {React.string(name)} </h2>
        <dl className="flex flex-wrap text-sm font-medium whitespace-pre">
          <div>
            <dt className="sr-only"> {React.string("Time")} </dt>
            <dd>
              <abbr title={j`$timeToMake minutes`}> {React.string(j`$timeToMake m`)} </abbr>
            </dd>
          </div>
          <div>
            <dt className="sr-only"> {React.string("Servings")} </dt>
            <dd> {React.string(j`$servings servings`)} </dd>
          </div>
        </dl>
      </div>
    </article>
  }
}

@react.component
let make = (~recipe) => {
  switch recipe {
  | SolidFoodRecipe({name, timeToMake, servings, image}) =>
    <FoodRecipe name timeToMake servings image />
  }
}
