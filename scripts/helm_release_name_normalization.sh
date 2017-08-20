#!/bin/bash

img_tag=$1;
ci_project_namespace=$2;
ci_project_name=$3;

# Normalize IMG_TAG
IFS='/' read -a array <<< $img_tag;
IFS='-' read -a array <<< ${array[-1]};
img_tag_normalized=${array[0]};
if [ "${img_tag_normalized:0:1}" == "#" ]; then img_tag_normalized=${img_tag_normalized:1:1}; fi;
for i in ${array[@]:1}; do img_tag_normalized=$img_tag_normalized-${i:0:1}; done;

# Normalize CI_PROJECT_NAMESPACE
ci_project_namespace_normalized=${ci_project_namespace:0:5}

# Normalize CI_PROJECT_NAME
IFS='-' read -a array <<< $ci_project_name;
ci_project_name_normalized=${array[0]};
for i in ${array[@]:1}; do ci_project_name_normalized=$ci_project_name_normalized-${i:0:1}; done;

echo $img_tag_normalized-$ci_project_namespace_normalized-$ci_project_name_normalized;
