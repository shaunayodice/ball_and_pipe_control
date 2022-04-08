function Sample = Sample_state(P_bins , V_bins , F_bins) 
clear all;
close all;

Len_V = size(V_bins);

Len_F = size(F_bins);

Len_P = size(P_bins);
P_sample = P_bins(rand(Len_P));
V_sample = V_bins(rand(Len_V));
F_sample = F_bins(rand(Len_F));



Sample = cat(P_sample, V_sample, F_sample)
