module Hello exposing (..)

import Html exposing (..)

--識別名称をエイリアス宣言
type alias Name = String
type alias Age = Int
type alias Person = {name: Name, age: Age}

-- 代入用変数(ほぼオブジェクトの生成)

shimbuichi = { name = "shimbuichi", age = "21" }
masami = { name = "masami", age = "30" }

-- 表示用DOMの生成
get_text x s = text (x ++ s)

name_age x =
    div [] [
        h1[] [get_text x.name ":"],
        h2[] [get_text x.age "歳"],
        hr [] []
    ]

main =
    div [] [
     name_age(shimbuichi),
     name_age(masami)
     ]
