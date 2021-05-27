@module external styles: {..} = "./App.module.css"

@react.component
let make = () => {
  <div className="bg-gradient-to-b from-hex-2d3436 to-hex-23272a w-full h-full p-16">
    <Header /> <Categories /> <Navbar />
  </div>
}
