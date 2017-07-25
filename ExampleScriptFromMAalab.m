


pth   = pwd;                  % path to node/edge files
files = 'example.node';       % name.edge
mesh  = fullfile(pth,files);  
exe   = '/Applications/Surfice/surfice.app/Contents/MacOS/surfice'; % path to surfice app

cmd = sprintf('%s -S "begin edgeload(''%s''); end."', exe, mesh);
system(cmd); 