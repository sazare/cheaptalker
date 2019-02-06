function parsej(m::String)
 token = []
 rjo = r"(.+)(wo|ha|ni|ru)"
 pm  = m
 while true
   m = match(rjo, pm)
   if nothing == m; break end
   cm = m.captures
   push!(token, m)
   pm = cm[1]
 end
 return token
end

m3="君ha僕niケーキwo与えru"

#==
# This file is a part of Julia. License is MIT: https://julialang.org/license

julia> match(r"(.+)ha","わたしha")
RegexMatch("わたしha", 1="わたし")

julia> match(r"([a-z]*)(.+)wo",m3)
RegexMatch("君ha僕niケーキwo", 1="", 2="君ha僕niケーキ")

julia> match(r"([a-z]+)(.+)wo",m3)
RegexMatch("ha僕niケーキwo", 1="ha", 2="僕niケーキ")

julia> m1=match(r"(wo|ha|ni|ru)(.+)(wo|ha|ni|ru)",m3)
RegexMatch("ha僕niケーキwo与えru", 1="ha", 2="僕niケーキwo与え", 3="ru")

julia> m1.captures
3-element Array{Union{Nothing, SubString{String}},1}:
"ha"
"僕niケーキwo与え"
"ru"

==#
#==
julia> for m in mm
       println("$(m.offsets)")
       end
==#

#==
julia> parsej(m3)
4-element Array{Any,1}:
("君ha僕niケーキwo与え", "ru")
("君ha僕niケーキ", "wo")
("君ha僕", "ni")
("君", "ha")
==#

