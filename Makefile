RELEASE=2.4

all:
	(rm -f ss-small-* && \
		for i in ss-tmux[0-9].png; do \
			convert "$$i" \
				-resize '150x' -resize 'x100<' \
				-gravity center -crop 150x100+0+0 +repage \
				"ss-small-$${i##ss-}"; \
		done)
	sed "s/%%RELEASE%%/${RELEASE}/g" index.html.in >index.html
