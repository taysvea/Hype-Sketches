HDrawablePool pool;
HColorPool colors;

void setup() {

	size(640,640);
	H.init(this).background(#202020);
	smooth();

	colors = new HColorPool()
		.add(#F27C50)
		.add(#66C7C8)
		.add(#E0344A)
		.add(#79BC72)
		.add(#F7EC9D)
		.add(#374A83)
	;

	pool = new HDrawablePool(550);
	pool.autoAddToStage()
		.add (
			new HShape("elephant.svg")
		)
		.layout (
			new HGridLayout()
			.startX(1) //
			.startY(1) //
			.spacing(40 ,25) //
			.cols(20) //
		)
		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.fill(#ECECEC)
						.anchorAt(H.CENTER)
						.size(.3) //
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
	noLoop();
}

void draw() {}

