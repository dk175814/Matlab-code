
%[acf,lags,bounds] = autocorr(p);
%T = 1:length(acf);
%plot(T,acf);
%x = 1:10;
%y=4*sin(x);
%autocorr(y,'Numlags',30)
load elcentro.mat
y = p;
L = length(t);
lag = 0:L-1;
auto_correlation = zeros(1,2*L-1);

for i = lag
	sum = 0;
	count = 0;
	for j = 1:L-i
		sum = sum + y(j)*y(j+i);
		count = count + 1;
	end
	auto_correlation(L+i) = sum/count;
	auto_correlation(L-i) = sum/count;
end

dt = t(2) - t(1);
plot((1-L:L-1).*dt,auto_correlation);
xlabel('lag');
ylabel('Auto correlation');