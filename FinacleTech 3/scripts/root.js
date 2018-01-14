//Bryan Wilhite (rasx@kintespace.com)

//Variables of window scope.
var isMs = false //Microsoft browser boolean.
var isMsMac = false //Microsoft Macintosh browser boolean.
var isSafariMac = false //Microsoft Macintosh Safari browser boolean.
var isMz = false //Mozilla browser boolean.
var isFlash6x = false //moock fpi [f.lash p.layer i.nspector] boolean.

var needsFlashHook = false

var i = 0
var obj0 = null
var vButtonLit = ''

//Sniff the crap.

//WARNING: this code depends on ./rootSniffer.js!
if(is_ie5_5up) isMs = true
if(is_mac && is_ie5up) isMsMac = true
if(is_safari) isSafariMac = true
if(is_gecko) isMz = true

function jsButtonDefault(objButton){
    with(objButton){
        style.backgroundColor = '#000000'
        style.color = '#ffffff'
    }
}

function jsButtonLight(objButton,vIsClick){
    with(objButton){
        style.backgroundColor = '#cccccc'
        style.color = '#000000'
        if(vIsClick) vButtonLit = id
    }
}

//Event handler.
function jsEvent(event){

    if(isMs) obj0 = event.srcElement

    //Based on http://developer.apple.com/internet/javascript/ie5macscripting.html
    if(isMsMac) obj0 = event.target

    if(isMz || isSafariMac) obj0 = event.currentTarget
    if(!isMs && !isMz && !isMsMac && !isSafariMac) return

    switch(event.type){
        case 'load':
            //Format tabs:
            obj0 = window.document.getElementsByTagName('div')
            for(i = 0; i < obj0.length; i++){
                if(obj0[i].id == 'tabButtons') obj0[i].style.display = 'block'
                if(obj0[i].className == 'uiTab'){
                    if(obj0[i].id != 'tab1') obj0[i].style.display = 'none'
                }
            }

            //Format buttons:
            obj0 = window.document.getElementsByTagName('button')
            for(i = 0; i < obj0.length; i++){
                if(isMs || isMsMac){
                    if(obj0[i].className == 'uiTabButton'){
                        obj0[i].onmouseout = new Function('jsEvent(event)')
                        obj0[i].onmouseover = new Function('jsEvent(event)')

                        if(obj0[i].id == 'tabButton1') jsButtonLight(obj0[i],true)
                    }
                }
                if(isMz){
                    if(obj0[i].className == 'uiTabButton'){
                        obj0[i].addEventListener('mouseout',jsEvent,false)
                        obj0[i].addEventListener('mouseover',jsEvent,false)

                        if(obj0[i].id == 'tabButton1') jsButtonLight(obj0[i],true)                    }
                }
            }
        break

        case 'mouseout':
            if(obj0.className == 'uiTabButton'){
                if(obj0.id != vButtonLit) jsButtonDefault(obj0)
            }
        break

        case 'mouseover':
            if(obj0.className == 'uiTabButton') jsButtonLight(obj0,false)
        break
    }
}

function jsTab(vButtonID,vTabID){
    var obj = window.document.getElementsByTagName('button')
    for(i = 0; i < obj.length; i++){
        if(obj[i].className == 'uiTabButton'){
            if(obj[i].id == vButtonID) jsButtonLight(obj[i],true)
            if(obj[i].id != vButtonID) jsButtonDefault(obj[i])
        }
    }

    obj = window.document.getElementsByTagName('div')
    for(i = 0; i < obj.length; i++){
        if(obj[i].className == 'uiTab'){
            if(obj[i].id == vTabID) obj[i].style.display = 'block'
            if(obj[i].id != vTabID) obj[i].style.display = 'none'
        }
    }
}
