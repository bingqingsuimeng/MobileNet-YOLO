cur_dir=$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd )
root_dir=$cur_dir/../..

cd $root_dir
HOME=/home/wht/share/learn/caffe190320/caffe_s3fd
redo=1
data_root_dir="/mnt/learn/myMobileNetv2-SSDLite/MobileNetv2-SSDLite/ssdlite"
dataset_name="sweep"
data_create_sh_dir="/mnt/learn/MobileNet-YOLO/data/sweep"
mapfile="labelmap_voc.prototxt"
anno_type="detection"
db="lmdb"
min_dim=0
max_dim=0
width=336
height=336

extra_cmd="--encode-type=jpg --encoded"
if [ $redo ]
then
  extra_cmd="$extra_cmd --redo"
fi
for subset in test trainval
do
  python $root_dir/scripts/create_annoset.py --anno-type=$anno_type --label-map-file=$data_create_sh_dir/$mapfile --min-dim=$min_dim --max-dim=$max_dim --resize-width=$width --resize-height=$height --check-label $extra_cmd $data_root_dir $root_dir/data/$dataset_name/$subset.txt $data_create_sh_dir/$db/$dataset_name"_"$subset"_"$db examples/$dataset_name
done

#create_annoset.py 
#--anno-type=detection
#--label-map-file = labelmap_face.prototxt
#--min-dim=0
#--max-dim=0
#--resize-width=640
#--resize-height=640
#--check-label 
#--extra_cmd=--encode-type=jpg --encoded --redo
#--root = /home/wht/share/learn
#--listfile = /home/wht/share/learn/data/FACE/trainval.txt
#--outdir = /home/wht/share/learn/FACE/lmdb/FACE_trainval_lmdb
#--exampledir = examples/FACE
