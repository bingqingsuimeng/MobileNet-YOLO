#!/bin/sh
mkdir -p snapshot
/mnt/learn/MobileNet-YOLO/build/tools/caffe train -solver="solver.prototxt" -gpu 0 2>&1|tee trainout.log
