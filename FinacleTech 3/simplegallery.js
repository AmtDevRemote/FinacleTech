var simpleGallery_navpanel={
	panel: {height:'45px', opacity:0.5, paddingTop:'5px', fontStyle:'bold 11px Verdana'}, 
	images: [ 'left.gif', 'play.gif', 'right.gif', 'pause.gif'], 
	imageSpacing: {offsetTop:[-4, 0, -4], spacing:10}, 
	slideduration: 500 
	}
function simpleGallery(settingarg){
	this.setting=settingarg
	settingarg=null
	var setting=this.setting
	setting.panelheight=(parseInt(setting.navpanelheight)>5)? parseInt(setting.navpanelheight) : parseInt(simpleGallery_navpanel.panel.height)
	setting.fadeduration=parseInt(setting.fadeduration)
	setting.curimage=(setting.persist)? simpleGallery.routines.getCookie("gallery-"+setting.wrapperid) : 0
	setting.curimage=setting.curimage || 0 
	setting.ispaused=!setting.autoplay[0] 
	setting.currentstep=0
	setting.totalsteps=setting.imagearray.length*setting.autoplay[2]
	setting.fglayer=0, setting.bglayer=1 
	setting.oninit=setting.oninit || function(){}
	setting.onslide=setting.onslide || function(){}
	var preloadimages=[], longestdesc=null
	setting.longestdesc="" 
	for (var i=0; i<setting.imagearray.length; i++){
		preloadimages[i]=new Image()
		preloadimages[i].src=setting.imagearray[i][0]
		if (setting.imagearray[i][3] && setting.imagearray[i][3].length>setting.longestdesc.length)
			setting.longestdesc=setting.imagearray[i][3]
	}
	var slideshow=this
	jQuery(document).ready(function($){
		var setting=slideshow.setting
		setting.$wrapperdiv=$('#'+setting.wrapperid).css({position:'relative', visibility:'visible', background:'black', overflow:'hidden', width:setting.dimensions[0], height:setting.dimensions[1]}).empty() //main gallery DIV
		if (setting.$wrapperdiv.length==0){ 
			alert("Error: DIV with ID \""+setting.wrapperid+"\" not found on page.")
			return
		}
		setting.$gallerylayers=$('<div class="gallerylayer"></div><div class="gallerylayer"></div>') //two stacked DIVs to display the actual slide 
			.css({position:'absolute', left:0, top:0})
			.appendTo(setting.$wrapperdiv)
		setting.gallerylayers=setting.$gallerylayers.get()
		setting.navbuttons=simpleGallery.routines.addnavpanel(setting)
		if (setting.longestdesc!="") 
			setting.descdiv=simpleGallery.routines.adddescpanel(setting)
		$(setting.navbuttons).filter('img.navimages').css({opacity:0.8})
			.bind('mouseover mouseout', function(e){
				$(this).css({opacity:(e.type=="mouseover")? 1 : 0.8})
			})
			.bind('click', function(e){
				var keyword=e.target.title.toLowerCase()
				slideshow.navigate(keyword) //assign behavior to nav images
			})
		setting.$wrapperdiv.bind('mouseenter', function(){slideshow.showhidenavpanel('show')})
		setting.$wrapperdiv.bind('mouseleave', function(){slideshow.showhidenavpanel('hide')})
		slideshow.showslide(setting.curimage)
		setting.oninit.call(slideshow)
		$(window).bind('unload', function(){ 
			$(slideshow.setting.navbuttons).unbind()
			if (slideshow.setting.persist) 
				simpleGallery.routines.setCookie("gallery-"+setting.wrapperid, setting.curimage)
			jQuery.each(slideshow.setting, function(k){
				if (slideshow.setting[k] instanceof Array){
					for (var i=0; i<slideshow.setting[k].length; i++){
						if (slideshow.setting[k][i].tagName=="DIV")
							slideshow.setting[k][i].innerHTML=null
						slideshow.setting[k][i]=null
					}
				}
				if (slideshow.setting[k].innerHTML) 
					slideshow.setting[k].innerHTML=null
				slideshow.setting[k]=null
			})
			slideshow=slideshow.setting=null
		})
	})
}
simpleGallery.prototype={

	navigate:function(keyword){
		clearTimeout(this.setting.playtimer)
		this.setting.totalsteps=100000  
		if (!isNaN(parseInt(keyword))){
			this.showslide(parseInt(keyword))
		}
		else if (/(prev)|(next)/i.test(keyword)){
			this.showslide(keyword.toLowerCase())
		}
		else{ 
			var slideshow=this
			var $playbutton=$(this.setting.navbuttons).eq(1)
			if (!this.setting.ispaused){
				this.setting.autoplay[0]=false
				$playbutton.attr({title:'Play', src:simpleGallery_navpanel.images[1]})
			}
			else if (this.setting.ispaused){
				this.setting.autoplay[0]=true
				this.setting.playtimer=setTimeout(function(){slideshow.showslide('next')}, this.setting.autoplay[1])
				$playbutton.attr({title:'Pause', src:simpleGallery_navpanel.images[3]})
			}
			slideshow.setting.ispaused=!slideshow.setting.ispaused
		}
	},
	showslide:function(keyword){
		var slideshow=this
		var setting=slideshow.setting
		var totalimages=setting.imagearray.length
		var imgindex=(keyword=="next")? (setting.curimage<totalimages-1? setting.curimage+1 : 0)
			: (keyword=="prev")? (setting.curimage>0? setting.curimage-1 : totalimages-1)
			: Math.min(keyword, totalimages-1)
		setting.gallerylayers[setting.bglayer].innerHTML=simpleGallery.routines.getSlideHTML(setting.imagearray[imgindex])
		setting.$gallerylayers.eq(setting.bglayer).css({zIndex:1000, opacity:0})
			.stop().css({opacity:0}).animate({opacity:1}, setting.fadeduration, function(){ 
				clearTimeout(setting.playtimer)
				setting.gallerylayers[setting.bglayer].innerHTML=null  
				try{
					setting.onslide.call(slideshow, setting.gallerylayers[setting.fglayer], setting.curimage)
				}catch(e){
					alert("Simple Controls Gallery: An error has occured somwhere in your code attached to the \"onslide\" event: "+e)
				}
				setting.currentstep+=1
				if (setting.autoplay[0]){
					if (setting.currentstep<=setting.totalsteps)
						setting.playtimer=setTimeout(function(){slideshow.showslide('next')}, setting.autoplay[1])
					else
						slideshow.navigate("play/pause")
				}
			}) 
		setting.gallerylayers[setting.fglayer].style.zIndex=999 
		setting.fglayer=setting.bglayer
		setting.bglayer=(setting.bglayer==0)? 1 : 0
		setting.curimage=imgindex
		setting.navbuttons[3].innerHTML=(setting.curimage+1) + '/' + setting.imagearray.length
		if (setting.imagearray[imgindex][3]){ 
			setting.$descpanel.css({visibility:'visible'})
			setting.descdiv.innerHTML=setting.imagearray[imgindex][3]
		}
		else if (setting.longestdesc!=""){ 
			setting.descdiv.innerHTML=null
			setting.$descpanel.css({visibility:'hidden'})
		}
	},
	showhidenavpanel:function(state){
		var setting=this.setting
		var endpoint=(state=="show")? setting.dimensions[1]-setting.panelheight : this.setting.dimensions[1]
		setting.$navpanel.stop().animate({top:endpoint}, simpleGallery_navpanel.slideduration)
		if (setting.longestdesc!="") 
			this.showhidedescpanel(state)
	},
	showhidedescpanel:function(state){
		var setting=this.setting
		var endpoint=(state=="show")? 0 : -setting.descpanelheight
		setting.$descpanel.stop().animate({top:endpoint}, simpleGallery_navpanel.slideduration)
	}
}
simpleGallery.routines={
	getSlideHTML:function(imgelement){
		var layerHTML=(imgelement[1])? '<a href="'+imgelement[1]+'" target="'+imgelement[2]+'">\n' : '' //hyperlink slide?
		layerHTML+='<img src="'+imgelement[0]+'" style="border-width:0" />'
		layerHTML+=(imgelement[1])? '</a>' : ''
		return layerHTML 
	},
	addnavpanel:function(setting){
		var interfaceHTML=''
		for (var i=0; i<3; i++){
			var imgstyle='position:relative; border:0; cursor:hand; cursor:pointer; top:'+simpleGallery_navpanel.imageSpacing.offsetTop[i]+'px; margin-right:'+(i!=2? simpleGallery_navpanel.imageSpacing.spacing+'px' : 0)
			var title=(i==0? 'Prev' : (i==1)? (setting.ispaused? 'Play' : 'Pause') : 'Next')
			var imagesrc=(i==1)? simpleGallery_navpanel.images[(setting.ispaused)? 1 : 3] : simpleGallery_navpanel.images[i]
			interfaceHTML+='<img class="navimages" title="' + title + '" src="'+ imagesrc +'" style="'+imgstyle+'" /> '
		}
		interfaceHTML+='<div class="gallerystatus" style="margin-top:1px">' + (setting.curimage+1) + '/' + setting.imagearray.length + '</div>'
		setting.$navpanel=$('<div class="navpanellayer"></div>')
			.css({position:'absolute', width:'100%', height:setting.panelheight, left:0, top:setting.dimensions[1], font:simpleGallery_navpanel.panel.fontStyle, zIndex:'1001'})
			.appendTo(setting.$wrapperdiv)
		$('<div class="navpanelbg"></div><div class="navpanelfg"></div>')
			.css({position:'absolute', left:0, top:0, width:'100%', height:'100%'})
			.eq(0).css({background:'black', opacity:simpleGallery_navpanel.panel.opacity}).end() 
			.eq(1).css({paddingTop:simpleGallery_navpanel.panel.paddingTop, textAlign:'center', color:'white'}).html(interfaceHTML).end() //"navpanelfg" div
			.appendTo(setting.$navpanel)
		return setting.$navpanel.find('img.navimages, div.gallerystatus').get()
	},

	adddescpanel:function(setting){
		setting.$descpanel=$('<div class="gallerydesc"><div class="gallerydescbg"></div><div class="gallerydescfg"><div class="gallerydesctext"></div></div></div>')
			.css({position:'absolute', width:'100%', left:0, top:-1000, zIndex:'1001'})
			.find('div').css({position:'absolute', left:0, top:0, width:'100%'})
			.eq(0).css({background:'black', opacity:simpleGallery_navpanel.panel.opacity}).end() 
			.eq(1).css({color:'white'}).end() 
			.eq(2).html(setting.longestdesc).end().end()
			.appendTo(setting.$wrapperdiv)
		var $gallerydesctext=setting.$descpanel.find('div.gallerydesctext')
		setting.descpanelheight=$gallerydesctext.outerHeight()
		setting.$descpanel.css({top:-setting.descpanelheight, height:setting.descpanelheight}).find('div').css({height:'100%'})
		return setting.$descpanel.find('div.gallerydesctext').get(0)
	},

	getCookie:function(Name){ 
		var re=new RegExp(Name+"=[^;]+", "i"); 
		if (document.cookie.match(re))
			return document.cookie.match(re)[0].split("=")[1]
		return null
	},

	setCookie:function(name, value){
		document.cookie = name+"=" + value + ";path=/"
	}
}
var mygallery=new simpleGallery({
	wrapperid: "simplegallery1", 
	dimensions: [1000, 180], 
	imagearray: [
		["images/Header_Img.png", "ashwgandha.htm","","If you don't take care our customer,Someone else will"],
		["images/Header_Img1.png", "genda.htm","", "Well done is better than well said"],
		["images/Header_Img2.png", "genda.htm","", "Competition creates better product,alliance creates better companies"]
		
	],
	autoplay: [true, 500, 2],
	persist: false,
	fadeduration: 500,
	oninit:function(){
			},
	onslide:function(curslide, i){ 
			}
})