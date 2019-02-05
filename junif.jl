#==
日本語の述語とunification

==#

s1="好き(ha=僕, ga=君)"
s2="文(ha=僕, ga=君, da=好き)"
s3="好き(ga=君, ha=僕)"
s4="好き(ga=僕, wo=君)"
s5="好き(ha=僕, wo=君)"

p1=Meta.parse(s1)
pp1=:(好き(ha=僕, ga=君))

q1=:(好き(ha=WHO, ga=君))

#junify(Subst(:WHO=>:WHO), q1, pp1) == Subst(:WHO=>僕)



