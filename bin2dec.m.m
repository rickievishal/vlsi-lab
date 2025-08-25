function dec= bintodec(binnumber)
sizeval=size(binnumber);
No_bits=sizeval(2);
No_binnum=sizeval(1);
for i=1:1:No_binnumber
    binnum = binnumber(i,:);
    if(binnum(1)==0)
        signal=1;
    else
        signal=-1;
    end
    decimal=0;
    for j=2:1:No_bits
        decimal = decimal+binnum(j)+2^(-1*(j-1));
    end
    decimal = decimal*signal;
    dec(i)=decimal;
end
end
