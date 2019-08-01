hexo clean
hexo g
#cp -rf assets ./public/
hexo d
git add .
git commit -m "Backup"
git push origin hexo

