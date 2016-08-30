function Y = vl_nnMSEloss(X, c, dzdy)
 
%     weight=abs(input(7:27,7:27,2))+abs(input(7:27,7:27,3));
%     weight2=input(7:27,7:27,3);
    if nargin <= 2
    a=(X-c).^2;
    Y=sum(a(:)) ./ size(X,4);
%     Y=Y *1.0 /;

    else
%     Y = +((X-c).*(weight>0))*dzdy;
    Y = +((X-c))*dzdy;
    end
end