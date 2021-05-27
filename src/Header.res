let title = "Discover"
let subtitle = "Explore the best places in the world"

@react.component
let make = () => {
  <div className="p-0">
    <h2 className="text-gray-100 text-5xl my-4"> {React.string(title)} </h2>
    <h3 className="text-gray-300 text-xl"> {React.string(subtitle)} </h3>
  </div>
}
