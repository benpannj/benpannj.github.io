D_TMP=/tmp

all:
	echo "deploy"
	
deploy:
	git checkout gh-pages
	jekyll build
	git add -A
	git commit -m "update source"
	cp -r _site/ /tmp/
	git checkout master
	rm -r ./*
	cp -r /tmp/_site/* ./
	git add -A
	git commit -m "deploy blog"
	git push origin master
	git checkout gh-pages
	echo "deploy succeed"
	git push origin gh-pages
	echo "push source"
