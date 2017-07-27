function OpenSurfIce(A,savename)
% Input 1: A is a 90x90 matrix to open in SurfIce
% Input 2: (optional) filename to save image as
% 
% Defaults: axial view, 30% mesh transparency
% AS

conmat2nodes(A,'temp');       % write node & edges
pth   = pwd;                  % path to node/edge files
files = 'temp.node';          % name.edge
edge  = fullfile(pth,files);  % full path
mesh  = '/Applications/Surfice/BrainNet/BrainMesh_ICBM152_smoothed.mz3'; % fullfile mesh
exe   = '/Applications/Surfice/surfice.app/Contents/MacOS/surfice';      % path to surfice app
 
% options:
more  = 'CLIPAZIMUTHELEVATION(0, 0, 130);'; % view angle
more  = [more 'SHADERXRAY(0.3, 1); '];      % transparency of brain and overlay
more  = [more 'VIEWAXIAL(true);'];          % axial viewpoint
more  = [more 'COLORBARVISIBLE(true);'];    % colorbar!

% save if savename passed
if nargin > 1
   more = [more sprintf('SAVEBMP(''%s'');',savename)];
end

cmd = sprintf('%s -S "begin meshload(''%s''); edgeload(''%s''); %s end."', exe, mesh, edge,more);
system(cmd);