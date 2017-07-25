function [node1,node2,strng] = conmat2nodes(A,savename,varargin)
% Write node & edge files for the AAL90 atlas
% Also returns node-to-node coordinates for the matrix specified.
%
% Input is the 90x90 connectivity matrix
% Input 2 (optional) is savename for the .edge and .node files
%
% AS2017

load([fileparts(which('conmat2nodes')),'/AAL_SOURCEMOD.mat']);

node1 = []; node2 = []; strng = [];
for i = 1:length(A)
    [ix,iy,iv] = find(A(i,:));
    
    if ~isempty(ix)
        conns = max(length(ix),length(iy));
        for nc = 1:conns
            node1 = [node1; template_sourcemodel.pos(i(1),:)];
            node2 = [node2; template_sourcemodel.pos(iy(nc),:)];
            strng = [strng; iv(nc)];
        end
    end
end

UsrVec = 0;
try v  = varargin{1};
    UsrVec = 1;
end

if nargin > 1;   
    C = template_sourcemodel.pos;
    C(:,[4 5]) = 1;
    
    E = A;
    E(isnan(E))=0;
    i = find(~sum(E));
    C(i,[4 5])=0;
    
    if UsrVec
        C(:,[4 5]) = [v,v];
    end
    
    dlmwrite([savename '.edge'],A,'delimiter','\t');
    dlmwrite([savename '.node'],C,'delimiter','\t');
end
