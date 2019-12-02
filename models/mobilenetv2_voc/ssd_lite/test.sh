#!/bin/sh
/mnt/learn/caffe191126/ssd/build/tools/caffe train -solver="solver_test.prototxt" \
--weights=deploy.caffemodel \
-gpu 0
