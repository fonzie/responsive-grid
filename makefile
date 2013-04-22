build:
	sass demo/demo.scss build/build.css --style expanded && sass demo/demo.scss build/build.min.css --style compressed && gzip -c build/build.min.css > build/build.min.css.gz

fallback:
	sass demo/no-mq.scss build/no-mq.css

.PHONY: build fallback