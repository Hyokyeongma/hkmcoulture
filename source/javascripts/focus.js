!(function(e) {
	var n = '250%';
	'undefined' == typeof Focus
		? (e.Focus = (function() {
				console.log('Initializing focus.js...');
				var e = {};
				return (
					(e.init = function(e) {
						(elID = e.elementID), (n = e.zoomFactor || '250%'), console.log(n, e.zoomFactor);
						var o = ('' !== elID ? document.getElementById(elID) : document).querySelectorAll('.focus-img');
						Array.from(o).forEach(function(e) {
							e.addEventListener(
								'mouseenter',
								function(e) {
									this.style.backgroundSize = n;
								},
								!1
							),
								e.addEventListener(
									'mousemove',
									function(e) {
										var n = this.getBoundingClientRect(),
											o = e.clientX - n.left,
											t = e.clientY - n.top,
											i = Math.round(100 / (n.width / o)),
											c = Math.round(100 / (n.height / t));
										this.style.backgroundPosition = i + '% ' + c + '%';
									},
									!1
								),
								e.addEventListener(
									'mouseleave',
									function(e) {
										(this.style.backgroundPosition = 'center'), (this.style.backgroundSize = 'cover');
									},
									!1
								);
						});
					}),
					e
				);
			})())
		: console.log('focus.js has been initialized already.');
})(window);
