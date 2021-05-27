type sandinessLevel = Coarse | Soft | Stones

type beach = {
  name: string,
  price: int,
  picture: string,
  sandiness: sandinessLevel,
}

let getItemsForCategory = (~category) => {
  [
    {
      name: "Kuta beach",
      price: 50,
      picture: "/assets/img/beach-1.webp",
      sandiness: Coarse,
    },
    {
      name: "Jimbaran",
      price: 46,
      picture: "/assets/img/beach-2.webp",
      sandiness: Soft,
    },
  ]
}
