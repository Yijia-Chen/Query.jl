using DataFrames, LINQ, NamedTuples, TypedTables

df1 = DataFrame(a=[1,2,3], b=[1.,2.,3.])
df2 = @Table(c=[2.,4.,2.], d=["John", "Jim","Sally"])

x = @from i in df1 begin
	@join j in df2 on get(i.a) equals convert(Int64,j.c)
	@select @NT(a=>i.a,b=>i.b,c=>j.c,d=>j.d,e=>"Name: $(j.d)")
end collect(DataFrame)

println(x)