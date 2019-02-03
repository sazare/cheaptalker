
function matching(re, message)

end

m = match(r"僕は(.)+が好き", "僕は君が好き")
m.match
m.captures
m.offset
m.offsets

#==
julia> m = match(r"僕は(.)*が好き", "僕は君が好き")
RegexMatch("僕は君が好き", 1="君")


julia> m = match(r"(.)+は(.)*が好き", "僕は君が好き")
RegexMatch("僕は君が好き", 1="僕", 2="君")

julia> m.captures
2-element Array{Union{Nothing, SubString{String}},1}:
 "僕"
 "君"

julia> m.offset
1

julia> m.match
"僕は君が好き"

日本語はむずかしい

julia> m=match(r"(.)+は", "僕は君が好き")
RegexMatch("僕は", 1="僕")

julia> m=match(r"(.)+が", "僕は君が好き")
RegexMatch("僕は君が", 1="君")

julia> m=match(r"(.)+好き", "僕は君が好き")
RegexMatch("僕は君が好き", 1="が")



julia> m=match(r"僕", "僕は太郎が好き")
RegexMatch("僕")
julia> m.offset
1
julia> m=match(r"太郎", "僕は太郎が好き")
RegexMatch("太郎")
julia> m.offset
7
julia> m.captures
0-element Array{Union{Nothing, SubString{String}},1}


julia> m=match(r"(.)+が好き", "僕は太郎が好き")
RegexMatch("僕は太郎が好き", 1="郎")


太郎、僕、君が既知なら、固有名詞のルールで先に取り出せる。

曖昧さは残して

光太郎だとどうなのかとか


固有名詞を1文字の記号に置き換えるのか??
複数文字をうまく扱えないか

==#
#==

julia> mm3=replace(mm2, "僕" => "S")
"Sは太郎が好き"

julia> mm4 = replace(mm3, "太郎" => "T")
"SはTが好き"


==#

#==
m1 = "君は僕にケーキを与える"
m2 = "僕に君はケーキを与える"
m3 = "君は僕にケーキを与える"

p11=match(r"僕", m1)
p12=match(r"君", m1)
p13=match(r"(.)+与える", m1)


#名前をつける
julia> p13=match(r"(に)(?<obj>\w+)を与える", m1)
RegexMatch("にケーキを与える", 1="に", obj="ケーキ")

julia> p13[:obj]
"ケーキ"

#とはいえ、[はがに]にすると'は'でhitしてこまる

==#
