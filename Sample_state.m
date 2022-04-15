%% Sample State Function
%
%
% Purpose: This function calculates the position of the sample 
% based of the v , f and p bins. 
% Created By: Yazhini Kumaravadivelan
%
%
% Modified By: Yazhini
%
%
% Modified On: 4/9



function Sample = Sample_state(P_bins , V_bins , F_bins) % Creates a function called Sample_state that uses variables V_bins, F_bins and P_bins and calculate the position of the sample.
clear all;
close all;

Len_V = size(V_bins); % Len_V variable measures the size based of V_bin function.

Len_F = size(F_bins); % Len_F variable measures the size based of F_bin function.

Len_P = size(P_bins); % Len_P variable measures the size based of P_bin function.

P_sample = P_bins(rand(Len_P)); % Formula for measureing the lenght of P bin.
V_sample = V_bins(rand(Len_V)); % Formula for measureing the lenght of V bin.
F_sample = F_bins(rand(Len_F));% Formula for measureing the lenght of F bin.



Sample = cat(P_sample, V_sample, F_sample); % Concatination operation to create matrix using the P_sample, V_sample and F_sample
