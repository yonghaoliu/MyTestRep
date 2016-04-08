function startup
if ~exist('./bin', 'dir')
  mkdir('./bin');
end

if ~isdeployed
  addpath('./dataio');
  addpath('./bin');
  addpath('./evaluation');
  addpath('./visualization');
  addpath('./src');
  addpath('./tools');
  addpath('./external');
  addpath('./external/qpsolver');
  % path to DCNN library, e.g., caffe
  conf = global_conf();
  caffe_root = conf.caffe_root;
  if exist(fullfile(caffe_root, '/matlab/caffe'), 'dir')
    addpath(fullfile(caffe_root, '/matlab/caffe'));
  else
    warning('Please install Caffe in %s', caffe_root);
  end
  
  %% 3d pose estimation
  addpath camera_and_pose/release/src;
  addpath camera_and_pose/release/data;
  addpath camera_and_pose/release/models;
  
  %% Motion capture data parsing
  addpath ndlutil;
  addpath mocap;
  
  % Akhter_CVPR_2015
  addpath Akhter_CVPR_2015;
  
  addpath subaxis;
  % addpath legendflex/legendflex;
  % addpath legendflex/setgetpos_V1.2;
  
  addpath TOOLBOX_common;
  addpath TOOLBOX_calib;

  addpath EPnP;

  addpath scripts;
  addpath dataset;
  
  if ~exist('tmp','dir')
    mkdir('tmp');
  end
  if ~exist('cache','dir')
    mkdir('cache');
  end
end
