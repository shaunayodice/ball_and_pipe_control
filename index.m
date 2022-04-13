p_bins=0: y_top/20: y_top;

v_bins = min_v: max_v/20: max_v;

state_spaceSize = perm(p_bins, v_bins);

s1_bins=[0,1];
s2_bins=[0,1];
s3_bins = [0,1];

state_variables = 3;

index_table = zeros(state_size, state_variables);

s1_counter = 1;
s2_counter = 1;
s3_counter = 1;

for i=1:Nrows(index_table)
    index_table(i,:)=[s1_bins(s1_counter),s2_bins(s2_counter), s3_bins(s3_counter)];

    s1_counter = s1_counter + 1;

    if (s1_counter > length(s1_bins))

        s1_counter = 1;
        s2_counter =s2_counter + 1;
       
        if(s2_counter > length(s2_bins))
              s2_counter = 1; 
              s3_counter = s3_counter + 1;
        end

    end
end



