


pth   = pwd;                  % path to node/edge files
files = 'example.node';       % name.edge
edge  = fullfile(pth,files);  % full path
mesh  = 'BrainMesh_Ch2.mz3';  % brain mesh 

exe   = '/Applications/Surfice/surfice.app/Contents/MacOS/surfice'; % path to surfice app

% options:
more  = 'CLIPAZIMUTHELEVATION(0, 0, 130);';
more  = [more 'SHADERXRAY(0.3, 1); '];

cmd = sprintf('%s -S "begin meshload(''%s''); edgeload(''%s''); %s end."', exe, mesh, edge,more);
system(cmd); 