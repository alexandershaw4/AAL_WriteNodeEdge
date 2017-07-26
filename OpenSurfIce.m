function OpenSurfIce(A)


conmat2nodes(A,'temp');       % write node & edges
pth   = pwd;                  % path to node/edge files
files = 'temp.node';          % name.edge
edge  = fullfile(pth,files);  % full path
mesh  = '/Applications/Surfice/BrainNet/BrainMesh_ICBM152_smoothed.mz3'; % fullfile mesh
exe   = '/Applications/Surfice/surfice.app/Contents/MacOS/surfice';      % path to surfice app
 
% options:
more  = 'CLIPAZIMUTHELEVATION(0, 0, 130);'; % view angle
more  = [more 'SHADERXRAY(0.3, 1); '];      % transparency of brain and overlay
 
cmd = sprintf('%s -S "begin meshload(''%s''); edgeload(''%s''); %s end."', exe, mesh, edge,more);
system(cmd);