hexo clean
hexo g -d
cp -rf new-pearl ./public/
git add .
git commit -m "Backup"
git push origin hexo

