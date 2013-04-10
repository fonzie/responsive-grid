build:
	sass index.scss build/build.css && sass index.scss build/build.min.css --style compressed && gzip -c build/build.min.css > build/build.min.css.gz

.PHONY: build gzip