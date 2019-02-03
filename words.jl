# prerequisit:
# install mecab and set PATH 

function mecab(in::String)
 file = mktemp()[1]
println( "file=$file" )
 run(pipeline(IOBuffer(in),`mecab`,file))
 lines=read(file,String)
 lines
end

using DelimitedFiles
"""
sample usage\n
julia> dd=mecab1("I love you")\n
4×8 Array{Any,2}:\n
 "I"     "名詞"  "固有名詞"  "組織"  "*"  "*"  "*"  "*"\n
 "love"  "名詞"  "一般"    "*"   "*"  "*"  "*"  "*"\n
 "you"   "名詞"  "固有名詞"  "組織"  "*"  "*"  "*"  "*"\n
 "EOS"   ""    ""      ""    ""   ""   ""   "" \n

dd[1:end,1] は分解された語列
"""
function mecab1(ins::String)
 lines=mecab("$ins\n")
 bb=replace(replace(lines, "\t" => ","), "EOS\n" => "") # EOSはいらないか?
 cc=readdlm(IOBuffer(bb), ',')

 return cc
end

