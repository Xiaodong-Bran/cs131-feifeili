function match = SIFTSimpleMatcher(descriptor1, descriptor2, thresh)
% SIFTSimpleMatcher 
%   Match one set of SIFT descriptors (descriptor1) to another set of
%   descriptors (decriptor2). Each descriptor from descriptor1 can at
%   most be matched to one member of descriptor2, but descriptors from
%   descriptor2 can be matched more than once.
%   
%   Matches are determined as follows:
%   For each descriptor vector in descriptor1, find the Euclidean distance
%   between it and each descriptor vector in descriptor2. If the smallest
%   distance is less than thresh*(the next smallest distance), we say that
%   the two vectors are a match, and we add the row [d1 index, d2 index] to
%   the "match" array.
%   
% INPUT:
%   descriptor1: N1 * 128 matrix, each row is a SIFT descriptor.
%   descriptor2: N2 * 128 matrix, each row is a SIFT descriptor.
%   thresh: a given threshold of ratio. Typically 0.7
%
% OUTPUT:
%   Match: N * 2 matrix, each row is a match.
%          For example, Match(k, :) = [i, j] means i-th descriptor in
%          descriptor1 is matched to j-th descriptor in descriptor2.
    if ~exist('thresh', 'var'),
        thresh = 0.7;
    end

    match = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % each row
    for i= 1: size(descriptor1,1)
        temp_des = descriptor1(i,:);
        temp_des_mat = repmat(temp_des,[size(descriptor2,1),1]);
        % @@@ matrix math
        temp_des_distance = sqrt(sum((temp_des_mat - descriptor2).^2,2));      
        [dis,index] = sort(temp_des_distance);
         
        % select good match
        if (dis(1)<thresh*dis(2))
            good_match = [i,index(1)];
            match = [match;good_match];
        end
    end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                 END YOUR CODE                                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
