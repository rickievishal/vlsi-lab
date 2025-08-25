function dec=bintodec(binnumber)
sizeval=size(binnumber);
No_bits=sizeval(2);
No_binnos=sizeval(1);
for i=1:1:No_binnos
    binnum = binnumber(i,:);
    if(binnum(1)==0)
        signval=1;
    else
        signval=-1;
    end
    decimal=0;
    for j=2:1:No_bits
        decimal = decimal+binnum(j)+2^(-1*(j-1));
    end
    decimal = decimal*signval;
    dec(i)=decimal;
end
end

