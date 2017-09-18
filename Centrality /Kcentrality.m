function result = Kcentrality(data, A, l)
n = size(data,1);
result = zeros(n, 1);

for i = 2:l
    cluster = kmeans(data, i);
    for j = 1:n
        for k = 1:n
            if(A(j,k) == 1)
                if(cluster(j) ~= cluster(k))
                    result(j) = result(j)+1;
                end
            end
        end
    end
end
            