var mygallery=new simpleGallery({
	wrapperid: "simplegallery1",
	dimensions: [800, 200], 
	imagearray: [
		["images/Header_Img.png", "ashwgandha.htm","","ashwgandha"],
		["images/Header_Img1.png", "genda.htm","", "genda"],
		["images/Header_Img2.png", "gulab.htm", "", "gulab"],
		
	],
	autoplay: [true, 2500, 2],
	persist: false, 
	fadeduration: 500,
	oninit:function(){ 
		
	},
	onslide:function(curslide, i){		
	}
})
