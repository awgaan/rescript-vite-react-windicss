type category = {
  name: string,
  namePl: string,
  icon: React.element,
}

let categories = [
  {
    name: "Beach",
    namePl: "Beaches",
    icon: <BeachIcon width="48px" />,
  },
  {
    name: "Barbeque Spot",
    namePl: "Barbeque Spots",
    icon: <BbqIcon width="48px" />,
  },
]

module CategoriesHeader = {
  @react.component
  let make = () => {
    <h2 className="text-gray-100 text-5xl"> {React.string("Categories")} </h2>
  }
}

module CategoryButton = {
  @react.component
  let make = (~category, ~active, ~setActiveCategory) => {
    let {name, icon} = category
    <button
      onClick={_ => setActiveCategory(_ => category)}
      className={cx([
        "p-2 mr-8 flex items-center justify-between rounded-xl border-2 bg-gradient-to-r transition duration-150",
        active ? "from-hex-08ed97 to-hex-05f3cc" : "bg-hex-2a2e31",
        active ? "ring-4 ring-teal-500 ring-opacity-20 border-transparent" : "border-hex-3d4144",
        active ? "" : "hover:(border-hex-05f3cc)",
      ])}>
      <span
        className={cx([
          "rounded-2xl p-1",
          active ? "bg-hex-2a2e31" : "bg-gradient-to-r from-hex-08ed97 to-hex-05f3cc",
        ])}>
        icon
      </span>
      <span
        className={cx(["pl-4 font-bold text-lg", active ? "text-gray-700" : "text-hex-b4b8ba"])}>
        {React.string(name)}
      </span>
    </button>
  }
}

module CategoryPicker = {
  @react.component
  let make = (~categories, ~activeCategory, ~setActiveCategory) => {
    let items = Belt.Array.map(categories, category => {
      <CategoryButton
        key={category.name} category active={activeCategory.name == category.name} setActiveCategory
      />
    })
    <div className="p-0 flex"> {React.array(items)} </div>
  }
}

module Card = {
  @react.component
  let make = (~title, ~subtitle, ~backgroundImage, ~overlayColor) => {
    <div
      className="w-64 h-92 p-4 mr-8 rounded-xl bg-cover relative"
      style={ReactDOM.Style.make(
        ~backgroundImage=`linear-gradient(#ffffff1A, ${overlayColor}CC), url(${backgroundImage})`,
        (),
      )}>
      <div className="absolute bottom-0 mb-4">
        <h3 className="text-gray-100 text-3xl m-0"> {React.string(title)} </h3>
        <h4 className="m-0"> subtitle </h4>
      </div>
    </div>
  }
}

module Places = {
  module BeachCard = {
    @react.component
    let make = (~beach: Api.beach) => {
      <Card
        title={beach.name}
        subtitle={<React.Fragment>
          <span className="text-2xl font-bold text-hex-27dfad">
            {React.string(`\$${beach.price->Belt.Int.toString}/`)}
          </span>
          <span className="text-gray-100"> {React.string("person")} </span>
        </React.Fragment>}
        backgroundImage={beach.picture}
        overlayColor="#197d62"
      />
    }
  }

  @react.component
  let make = (~activeCategory) => {
    let (items: array<Api.beach>, setItems) = React.useState(_ => [])
    let itemCards = Belt.Array.map(items, item => {
      <BeachCard key={item.name} beach={item} />
    })

    React.useEffect1(() => {
      setItems(_ => Api.getItemsForCategory(~category=activeCategory))
      None
    }, [activeCategory])

    <div className="my-10">
      <header className="flex justify-between items-end">
        <h2 className="text-gray-100 text-5xl m-0">
          {React.string(`Popular ${activeCategory.namePl}`)}
        </h2>
        <a href="#" className="text-hex-2b9072 no-underline text-lg font-bold">
          {React.string("See all")}
        </a>
      </header>
      <div className="mt-8 flex flex-wrap"> {React.array(itemCards)} </div>
    </div>
  }
}

@react.component
let make = () => {
  let (activeCategory, setActiveCategory) = React.useState(_ => categories[0])
  <div>
    <CategoriesHeader />
    <CategoryPicker categories activeCategory setActiveCategory />
    <Places activeCategory />
  </div>
}
