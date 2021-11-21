## Main Concept
- Hello Purs
- Introducing Purs


## Learning
I will assume that you are familiar with the basics of JavaScript and Haskell. Because many of the concepts will have some interpretation in Haskell.

### Fundamental
- Children dibuat didalam brackets `[..]`, contoh
  ```purs
  HH.div_ 
    [ HH.h1_ [HH.text label]
    , HH.div_
        [HelloPurs.make]
    , HH.h2_ [HH.text label]
    ]
  ```
  Artinya div mempunyai 3 item children: h1, div, h2. Pemisahan itemnya menggunakan `koma ,` dan children menggunakan indentasi spasi

- Rules: Must have one parent element
   ```purs
    make = do
      HH.div_ 
        [
          ...
        ] 
   ```
- Perbedaan Type Array (HTML) <-> Node (HTML)
   Coba lihat contoh ini:
   ```purs
    -- Type: Array (HTML w i) → HTML w i
    HH.div_ [ ... ]
    
    -- Type: Node HTMLh1 w i
    HH.div [ ... ]
   ```
    Perbedaan dari tag diatas yang paling terlihat jelas terkait dengan **kapan menggunakannya**. Jika ingin menambahkan **attribute (e.g className)** maka gunakan `div`, namun     jika hanya ingin me-return **Element** saja gunakan `div_`. `div_` ini juga berfungsi untuk me-return Element yang sifatnya banyak, jdi maksudnya lebih dari satu children       item. 
    
    Rules: kalo `div` dia punya 2 kembalian: Prop dan Element, sedangkan `div_` hanya 1 kembalian: Element
- Write ClassName
   `class` termasuk attribute, jadi penulisannya seperti ini:
   ```purs
   -- Default:
   HH.div
    [ HP.class_ $ HH.ClassName "container"] -- Attribute
    [ HH.h1_ [ HH.text "Hello Purs" ] ] -- Element/Node
    
   -- Multiple classes:
   HH.div
    [ HP.classes $ [ HH.ClassName "class-1", HH.ClassName "class-2" ] -- Attribute
    [ HH.h1_ [ HH.text "Hello Purs" ] ] -- Element/Node
    
   -- Custom attribute
   -- -- Utils
   className :: forall r i. String -> HH.IProp (class :: String | r) i
   className = HP.class_ <<< HH.ClassName

   HH.div
    [ className "container" ] -- Attribute
    [ HH.h1_ [ HH.text "Hello Purs" ] ] -- Element/Node
   ```