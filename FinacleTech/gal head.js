var mygallery=new simpleGallery({
	wrapperid: "simplegallery1",
	dimensions: [800, 200], 
	imagearray: [
		["images/Header_Img.png", "ashwgandha.htm","","If you don't take care our customer,Someone else will"],
		["images/Header_Img1.png", "genda.htm","", "Well done is better than well said"],
		["images/Header_Img2.png", "gulab.htm", "", "Competition creates better product,alliance creates better companies"]
		
	],
	autoplay: [true, 2500, 2],
	persist: false, 
	fadeduration: 500,
	oninit:function(){ 
		
	},
	onslide:function(curslide, i){		
	}
})
