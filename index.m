p_bins=0: y_top/20: y_top;

v_bins = min_v: max_v/20: max_v;

state_spaceSize = perm(p_bins, v_bins);

s1_bins=[0,1];
s2_bins=[0,1];

index_table = zeros(state_size, state_v);

s1Counter = 1;
S2Counter = 1;

for i=1:Nrows(index_table)
    index_table(i,:)=[s1_bins(s1Counter),s2_bins(S2Counter)];

    if (s1_counter > length(s1_bins))

        s1_counter =1;
        s2_counter =1;
       
        if(s2_counter > length(s2_bins))
              s2_counter=1; 
        end

    end
end



