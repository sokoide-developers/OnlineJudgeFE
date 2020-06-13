#!/bin/sh

PACKAGE=dist.zip

COLOR=#A3D3F2
sed -i s/"background-color: #eee;"/"background-color: $COLOR;"/ src/styles/common.less
sed -i s/"background-color: #EDECEC;"/"background-color: $COLOR;"/ src/pages/admin/views/Home.vue

npm run build

if [ -f $PACKAGE ]; then
        rm $PACKAGE
fi

zip -r $PACKAGE dist/*
scp $PACKAGE lab5:~/repo/OnlineJudge

sed -i s/"background-color: $COLOR;"/"background-color: #eee;"/ src/styles/common.less
sed -i s/"background-color: $COLOR;"/"background-color: #EDECEC;"/ src/pages/admin/views/Home.vue

# done
echo "run below 1 or 2 on lab5"
echo "1)"
echo cd ~/repo/OnlineJudge
echo docker build . -t sokoide/oj-backend
echo cd ~/repo/docker/lab5
echo docker-compose down
echo docker-compose up -d
echo "2)"
echo cd ~/repo/docker/lab5
echo docker-compose down
echo docker-compose up --build -d
