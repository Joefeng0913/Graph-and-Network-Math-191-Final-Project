function result = CurrentFlowCloseness(A)
n = size(A,1);
NC = n-1;
result = zeros(n, 1);
num_edge = sum(A(:))/2;
w = ones(num_edge,1);
edge_list = zeros(num_edge,2);
counter = 1;
list = (1:n)';
for i = 1:n
    for j = i+1:n
        if(A(i,j) == 1)
            edge_list(counter, 1) = i;
            edge_list(counter, 2) = j;
            counter = counter+1;
        end
    end
end

for i = 1:n
    s = ones(n-1,1)*i;
    t = setdiff(list,i);
    current = [s t];
    er = EffectiveResistances(current,edge_list,w,1e-5,1,'org');
    result(i) = NC/sum(er);
end
    